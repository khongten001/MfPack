// FactoryX
//
// Copyright: � FactoryX. All rights reserved.
//
// Project: MfPack - MediaFoundation
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: frmMain.pas
// Kind: Pascal Unit
// Release date: 18-11-2022
// Language: ENU
//
// Revision Version: 3.1.4
//
// Description:
//   Main form.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX)
// Contributor(s): Ciaran, Tony (maXcomX)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 28/08/2022 All                 PiL release  SDK 10.0.22621.0 (Windows 11)
// 20/02/2023 Tony                Fixed switching camera issue that results in Access Denied error.
//------------------------------------------------------------------------------
//
// Remarks: Requires Windows 10 (2H20) or later.
//
// Related objects: -
// Related projects: MfPackX314/Samples/MFCaptureEngineVideoCapture
//
// Compiler version: 23 up to 35
// SDK version: 10.0.22621.0
//
// Todo: -
//
//==============================================================================
// Source: -
//==============================================================================
//
// LICENSE
//
// The contents of this file are subject to the Mozilla Public License
// Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// https://www.mozilla.org/en-US/MPL/2.0/
//
// Software distributed under the License is distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
// License for the specific language governing rights and limitations
// under the License.
//
// Non commercial users may distribute this sourcecode provided that this
// header is included in full at the top of the file.
// Commercial users are not allowed to distribute this sourcecode as part of
// their product.
//
//==============================================================================
unit frmMain;

interface

uses
  {WinApi}
  Winapi.Windows,
  Winapi.Messages,
  WinApi.ComBaseApi,
  Winapi.ShlObj,
  Winapi.KnownFolders,
  WinApi.WinApiTypes,
  Winapi.CommCtrl,
  WinApi.WinError,
  {System}
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Services.Dbt,
  System.Math,
  {VCL}
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.AppEvnts,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  {ActiveX}
  WinApi.ActiveX.ObjBase,
  {MediaFoundationApi}
  WinApi.MediaFoundationApi.MfApi,
  WinApi.MediaFoundationApi.MfIdl,
  WinApi.MediaFoundationApi.MfObjects,
  WinApi.MediaFoundationApi.MfUtils,
  WinApi.MediaFoundationApi.MfError,
  WinApi.MediaFoundationApi.MfMetLib,
  WinApi.MediaFoundationApi.MfCaptureEngine,
  {Application}
  CaptureEngine,
  SampleConverter,
  dlgChooseDevice,
  DeviceExplorer,
  Utils;

type
  TMainWindow = class(TForm)
    MainMenu: TMainMenu;
    Capture1: TMenuItem;
    mnuStartPreview: TMenuItem;
    mnuChooseDevice: TMenuItem;
    mnuStartRecording: TMenuItem;
    SaveFileDlg: TSaveDialog;
    N1: TMenuItem;
    Exit1: TMenuItem;
    pnlSnapShot: TPanel;
    pbCapture: TPaintBox;
    pnlControls: TPanel;
    butSaveToFile: TButton;
    butTakePhoto: TButton;
    chkNoPreview: TCheckBox;
    pnlInfo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure mnuChooseDeviceClick(Sender: TObject);
    procedure mnuStartPreviewClick(Sender: TObject);
    procedure butTakePhotoClick(Sender: TObject);
    procedure mnuStartRecordingClick(Sender: TObject);
    procedure butSaveToFileClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Exit1Click(Sender: TObject);

  private
    { Private declarations }
    hPreview: HWND;
    ptrDevNotify: HDEVNOTIFY; // Devicenotify pointer.
    bRecording: Boolean;
    bPreviewing: Boolean;
    bImageCleared: Boolean;
    bDeviceLost: Bool;
    bmCapturedFrame: TMfpBitmap;
    iSelectedDevice: Integer;
    iSelectedFormat: Integer;
    pSelectedDevice: IMFActivate;
    lSampleTime: LongLong;
    FSampleConverter: TSampleConverter;

    procedure DestroyCaptureObjects();
    function CreateDeviceExplorer(): HResult;

    // Update menuitems and status
    procedure UpdateUI();

    // Process sample in main thread
    function ProcessSample(aSample: IMFSample): HResult;
    procedure PaintCapture(bm: TMfpBitmap);
    procedure GetPaintArea(AImage: TMfpBitmap;
                           var AWidth: Integer;
                           var AHeight: Integer;
                           var ATop: Integer;
                           var ALeft: Integer);

    // Messages
    procedure OnSize(var message: TWMSize); message WM_SIZE;
    procedure OnRecievedSample(var AMessage: TMessage); message WM_RECIEVED_SAMPLE_FROM_CALLBACK;
    procedure OnCaptureEvent(var AMessage: TMessage); message WM_APP_CAPTURE_EVENT;
    procedure OnCaptureEventHandled(var AMessage: TMessage); message WM_APP_CAPTURE_EVENT_HANDLED;
    procedure OnDeviceChange(var AMessage: TMessage); message WM_DEVICECHANGE;

  public
    { Public declarations }

  end;

var
  MainWindow: TMainWindow;


implementation

{$R *.dfm}


// Messages

// OnSize
procedure TMainWindow.OnSize(var message: TWMSize);
var
  crD: MFVideoNormalizedRect;
  pcrD: PMFVideoNormalizedRect;

begin
  inherited;

  if not Visible then
    Exit;

  if Assigned(FCaptureManager) then
    begin
      crD.left := 0;
      crD.top := 0;
      crD.right := pbCapture.ClientWidth;
      crD.bottom := pbCapture.ClientHeight;
      pcrD := @crD;
      FCaptureManager.UpdateVideo(pcrD);
    end;
end;


procedure TMainWindow.OnRecievedSample(var AMessage: TMessage);
var
  pSample: IMFSample;
begin
  pSample := IMFSample(Pointer(AMessage.WParam));
  // process the sample
  if Assigned(pSample) then
    ProcessSample(pSample);
end;


procedure TMainWindow.OnCaptureEvent(var AMessage: TMessage);
var
  hr: HResult;
begin
  hr := FCaptureManager.OnCaptureEvent(AMessage.WParam,
                                       AMessage.LParam);
  if FAILED(hr) then
    begin
      ErrMsg('Capturemanager.OnCaptureEvent reported an error',
             hr);
    end;
end;


procedure TMainWindow.OnCaptureEventHandled(var AMessage: TMessage);
begin
  if SUCCEEDED(HResult(AMessage.WParam)) then
    UpdateUI()
  else
    ErrMsg('CaptureManager reported a failure.',
           HResult(AMessage.WParam));
end;


procedure TMainWindow.OnDeviceChange(var AMessage: TMessage);
var
  PDevBroadcastHeader: PDEV_BROADCAST_HDR;
  pDevBroadCastIntf: PDEV_BROADCAST_DEVICEINTERFACE;
  pwcDevSymbolicLink: PWideChar;
  pwcCurrentDeviceSymLink: PWideChar;
  hr: HResult;
  strCurrentDeviceName: string;

begin
  if (AMessage.WParam = DBT_DEVICEREMOVECOMPLETE) then
    begin
      // remember the current device that is activated
      strCurrentDeviceName := WideCharToString(FDeviceExplorer.DeviceDisplayName);
      pwcCurrentDeviceSymLink := FDeviceExplorer.DeviceSymbolicLink;

      // Check for added/removed devices, regardless of whether
      // the application is capturing video at this time.
      if FAILED(CreateDeviceExplorer()) then
        Exit;

      // Check if the current video capture device was lost.
      if (PDEV_BROADCAST_HDR(AMessage.LParam).dbch_devicetype <> DBT_DEVTYP_DEVICEINTERFACE) then
        Exit;

      // Get the symboliclink of the lost device and check.
      PDevBroadcastHeader := PDEV_BROADCAST_HDR(AMessage.LParam);
      pDevBroadCastIntf := PDEV_BROADCAST_DEVICEINTERFACE(PDevBroadcastHeader);

      // Note: Since Windows 8 the value of dbcc_name is no longer the devicename, but the symboliclink of the device.
      // Dereference the struct's field dbcc_name (array [0..0] of WideChar) for a readable string.
      pwcDevSymbolicLink := PChar(@pDevBroadCastIntf^.dbcc_name);

      hr := S_OK;
      bDeviceLost := False;

      if Assigned(FCaptureManager) then
        if FCaptureManager.IsPreviewing or FCaptureManager.IsRecording then
          begin
            if (StrIComp(pwcCurrentDeviceSymLink,
                         pwcDevSymbolicLink) = 0) then
              bDeviceLost := True;

            if (FAILED(hr) or bDeviceLost) then
              begin
                MessageDlg(Format('Lost capture device: %s', [strCurrentDeviceName]),
                           mtError,
                           mbOKCancel,
                           0);
                iSelectedDevice := -1;
                iSelectedFormat := -1;
                UpdateUI();
              end;
          end;
    end;
end;


// ProcessSample
function TMainWindow.ProcessSample(aSample: IMFSample): HResult;
var
  hr: HResult;
  FMemoryStream: TMemoryStream;

label
  done;
begin

  hr := FSampleConverter.UpdateConverter(g_pDXGIMan,
                                         FDeviceExplorer.DeviceProperties[FDeviceExplorer.DeviceIndex].aVideoFormats[FDeviceExplorer.FormatIndex].mfMediaType);
  if FAILED(hr) then
    goto done;

  hr := FSampleConverter.DataFromSample(aSample,
                                        FDeviceExplorer.DeviceProperties[FDeviceExplorer.DeviceIndex].aVideoFormats[FDeviceExplorer.FormatIndex],
                                        FMemoryStream);
  if FAILED(hr) then
    goto done;

  if Assigned(FMemoryStream) then
    begin
      if Assigned(bmCapturedFrame) then
        FreeAndNil(bmCapturedFrame);
      // stream returned, let's assign to preview
      bmCapturedFrame := TMfpBitmap.Create;
      bmCapturedFrame.PixelFormat := pf32bit;
      // Set streampointer to start.
      FMemoryStream.Position := 0;

      if bmCapturedFrame.CanLoadFromStream(FMemoryStream) then
        begin
          bmCapturedFrame.LoadFromStream(FMemoryStream);
          if not bmCapturedFrame.Empty then
            begin
              hr := aSample.GetSampleTime(lSampleTime);
              if FAILED(hr) then
                goto done;

              PaintCapture(bmCapturedFrame);
            end
          else
            begin
              hr := E_FAIL;
              goto done;
            end;
        end
      else
        goto done;

    end
  else
    hr := E_POINTER;

done:
  if Assigned(FMemoryStream) then
    FMemoryStream.Destroy();
  Result := hr;
end;


procedure TMainWindow.PaintCapture(bm: TMfpBitmap);
var
  iWidth: Integer;
  iHeight: Integer;
  iTop: Integer;
  iLeft: Integer;


begin
  if not bImageCleared and Assigned(bm) and not bm.Empty then
    begin
      // Clear the area
      pbCapture.Canvas.Brush.Style := bsSolid;
      pbCapture.Canvas.Brush.Color := clBlack;
      pbCapture.Canvas.FillRect(pbCapture.Canvas.ClipRect);

      SetStretchBltMode(pbCapture.Canvas.Handle,
                        HALFTONE);
      SetBrushOrgEx(pbCapture.Canvas.Handle,
                    0,
                    0,
                    nil);

      // Scale and center the image
      GetPaintArea(bm,
                   iWidth,
                   iHeight,
                   iTop,
                   iLeft);

      // Stretch draw the whole image
      StretchBlt(pbCapture.Canvas.Handle,
                 iLeft,
                 iTop,
                 iWidth,
                 iHeight,
                 bm.Canvas.Handle,
                 0,
                 0,
                 bm.Width,
                 bm.Height,
                 SRCCOPY);
      butSaveToFile.Enabled := True;
    end
  else
    butSaveToFile.Enabled := False;
end;


procedure TMainWindow.GetPaintArea(AImage: TMfpBitmap;
                                   var AWidth: Integer;
                                   var AHeight: Integer;
                                   var ATop: Integer;
                                   var ALeft: Integer);
var
  iRatio: Double;
  iHeightRatio: Double;
  iWidthRatio: Double;

begin
  iHeightRatio := pbCapture.Height / AImage.Height;
  iWidthRatio := pbCapture.Width / AImage.Width;
  if (iHeightRatio > iWidthRatio) then
    iRatio := Min(1,
                  iWidthRatio)
  else
    iRatio := Min(1,
                  iHeightRatio);

  AWidth := Round(AImage.Width * iRatio);
  AHeight := Round(AImage.Height * iRatio);
  ATop := (pbCapture.Height - AHeight) div 2;
  ALeft := (pbCapture.Width - AWidth) div 2;
end;


procedure TMainWindow.butSaveToFileClick(Sender: TObject);
begin

  SaveFileDlg.FileName := Format('Capture_%s', [HnsTimeToStr(lSampleTime,
                                                             '_',
                                                             False)]);
  if SaveFileDlg.Execute then
    begin
      SaveImage(bmCapturedFrame,
                SaveFileDlg.FileName,
                TImageType(Ord(SaveFileDlg.FilterIndex - 1)));
    end;

end;


// butTakePhotoClick
procedure TMainWindow.butTakePhotoClick(Sender: TObject);
var
  hr: HResult;
  SnapShotOption: TSnapShotOptions;
label
  done;

begin
  hr := E_FAIL;
  if chkNoPreview.Checked then
    SnapShotOption := ssoFile
  else
    SnapShotOption := ssoCallBack;

  if Assigned(FCaptureManager) then
    hr := FCaptureManager.TakePhoto(SnapShotOption,
                                    FDeviceExplorer.DeviceProperties[FDeviceExplorer.DeviceIndex].aVideoFormats[FDeviceExplorer.FormatIndex].mfMediaType);
  if FAILED(hr) then
    goto Done;

done:
  if FAILED(hr) then
    ErrMsg('butTakePhotoClick: ' + ERR_PHOTO,
            hr);
end;


procedure TMainWindow.DestroyCaptureObjects();
begin
  if Assigned(bmCapturedFrame) then
    FreeAndNil(bmCapturedFrame);

  if Assigned(FCaptureManager) then
    begin
      FCaptureManager.ResetCaptureManager();
      FCaptureManager.Free;
    end;

  FChooseDeviceParam.Reset();

end;


// FormCreate
procedure TMainWindow.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;

  DestroyCaptureObjects();

  if Assigned(FSampleConverter) then
     FreeAndNil(FSampleConverter);

  if Assigned(FDeviceExplorer) then
     begin
       FreeAndNil(FDeviceExplorer);
     end;

  UnRegisterForDeviceNotification(ptrDevNotify);
  ptrDevNotify := nil;

  MFShutdown();
  CoUnInitialize();
  CanClose := True;
end;


procedure TMainWindow.FormCreate(Sender: TObject);
var
  hr: HResult;
label
  done;

begin

  // Initialize COM
  CoInitializeEx(nil,
                 COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE);
  // Startup Media Foundation
  hr := MFStartup(MF_VERSION,
                  MFSTARTUP_FULL);

  if FAILED(hr) then
    begin
      MessageBox(0,
                 lpcwstr('Your computer does not support this Media Foundation API version' + IntToStr(MF_VERSION) + '.'),
                 lpcwstr('MFStartup Failure!'),
                 MB_ICONSTOP);
      goto Done;
    end;

  iSelectedDevice := -1;
  iSelectedFormat := -1;
  bDeviceLost := False;
  hPreview := Handle;

  // Create DeviceExplorer here to check for suitable devices.
  hr := CreateDeviceExplorer();
  // There is no need to shutdown the application, because a user can still add devices.
  if (hr = MF_E_NO_CAPTURE_DEVICES_AVAILABLE) then
    begin
      MessageBox(0,
                 lpcwstr('Currently there are no devices found: Please insert a device.'),
                 lpcwstr('No capture devices found.'),
                 MB_ICONWARNING);
      hr := S_OK;
      goto done;
    end;
  // All other failures will result in termination.
  if FAILED(hr) then
    begin
      MessageBox(0,
                 lpcwstr('Failed to create the DeviceExplorer, Resultcode = (' + IntToStr(hr) + ').'),
                 lpcwstr('DeviceExplorer Failure!'),
                 MB_ICONSTOP);
      goto done;
    end;

  // Create the capture engine
  FCaptureManager := TCaptureManager.Create(Handle);

  if not Assigned(FCaptureManager) then
    begin
      ErrMsg('AfterConstruction: Can not create CaptureManager. The application will be closed.',
             E_POINTER);
      goto done;
    end;

  hr := FCaptureManager.InitializeCaptureManager(hPreview,
                                                 Handle,
                                                 pSelectedDevice);
  if SUCCEEDED(hr) then
    // Create the sampleconverter
    FSampleConverter := TSampleConverter.Create()
  else
    hr := E_POINTER;

  //
  if not RegisterForDeviceNotification(Handle,
                                       ptrDevNotify) then
    hr := E_FAIL;

done:
  if FAILED(hr) then
    Application.Terminate;
end;


// CreateDeviceExplorer
// Callers: FormCreate
function TMainWindow.CreateDeviceExplorer(): HResult;
var
  hr: HResult;
label
  done;

begin

  // Destroy and Create DeviceParam class that holds the Activate pointers and other properties of the selected device.
  if Assigned(FDeviceExplorer) then
    FreeAndNil(FDeviceExplorer);

  FDeviceExplorer := TDeviceExplorer.Create(hr);

  if FAILED(hr) then
    goto Done;

  // check for valid capture device(s)
  if (FDeviceExplorer.DevicesCount = 0) then
    begin
      hr := MF_E_NO_CAPTURE_DEVICES_AVAILABLE;
      ShowMessage(format('No capture devices found on this system (hr = %d)',
                         [hr]));
      goto Done;
    end;
done:
  Result := hr;
end;


// mnuChooseDeviceClick
procedure TMainWindow.mnuChooseDeviceClick(Sender: TObject);
var
  hr: HResult;
  pAttributes: IMFAttributes;

label
  done;

begin

  // Stop the current manager
  if Assigned(FCaptureManager) then
    begin
      if FCaptureManager.IsPreviewing then
        FCaptureManager.StopPreview();
      if FCaptureManager.IsRecording then
        FCaptureManager.StopRecording();
    end;

  hr := MFCreateAttributes(pAttributes,
                           1);
  if FAILED(hr) then
    goto done;

  hr := pAttributes.SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE,
                            MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID);
  if FAILED(hr) then
    goto done;

  hr := MFEnumDeviceSources(pAttributes,
                            FChooseDeviceParam.ppDevices,
                            FChooseDeviceParam.count);
  if FAILED(hr) then
    goto done;

  // Get a new instance of the device explorer
  hr := CreateDeviceExplorer();
  if FAILED(hr) then
    goto done;

  // Ask the user to select one.
  if (ChooseDeviceDlg.ShowModal = 1212) then
    begin
      {$POINTERMATH ON}
      pSelectedDevice := FChooseDeviceParam.ppDevices[FChooseDeviceParam.SelectedDevice];
      {$POINTERMATH OFF}
      iSelectedDevice := FChooseDeviceParam.SelectedDevice;
      iSelectedFormat := FChooseDeviceParam.SelectedFormat;
      hPreview := Handle;

      // Set DeviceExplorer properties
      hr := FDeviceExplorer.SetCurrentDeviceProperties(iSelectedDevice,
                                                       iSelectedFormat);
      if FAILED(hr) then
        goto Done;

      {$POINTERMATH ON}

      hr := FCaptureManager.InitializeCaptureManager(hPreview,
                                                     Handle,
                                                     IUnknown(pSelectedDevice));
      if FAILED(hr) then
        goto Done;
    end
  else
    begin
      // User canceled device selection.
      hr := S_OK;
    end;

done:

  if (hr = MF_E_NO_CAPTURE_DEVICES_AVAILABLE) or (FChooseDeviceParam.Count = 0) then
    ShowMessage(format('No capture devices found on this system (hr = %d)',
                       [hr]))
  else if FAILED(hr) then
    begin
      ErrMsg(ERR_INITIALIZE + ' The application will be closed.',
             hr);
      Application.Terminate();
    end;

  UpdateUI();
end;


// UpdateUI
procedure TMainWindow.UpdateUI();
var
  bEnableRecording: Boolean;
  bEnablePhoto: Boolean;
  bEnablePreview: Boolean;

begin

  bEnablePhoto := False;
  bEnableRecording := False;
  bEnablePreview := ((iSelectedDevice > -1) and (iSelectedFormat > -1));

  if bDeviceLost then
    begin
      if FCaptureManager.IsRecording then
        FCaptureManager.StopRecording()
      else if FCaptureManager.IsPreviewing then
        FCaptureManager.StopPreview;

      mnuStartRecording.Caption := 'Start Recording';
      mnuStartPreview.Tag := 0;
      mnuStartRecording.Enabled := bEnableRecording;
      mnuStartPreview.Enabled := False;
      pnlInfo.Caption := 'Please select a device.';
      pnlControls.Enabled := False;
      bDeviceLost := False;
      Exit;
    end;

  if not Assigned(FCaptureManager) then
    begin
      pnlInfo.Caption := 'Please select a device.';
      Exit;
    end;

  if not FCaptureManager.IsInitialized or (iSelectedDevice = -1) then
    pnlInfo.Caption := 'Please select a device.'
  else
    begin
      pnlInfo.Caption := 'Please select ''Start Preview'' or ''Choose Device ''';
      mnuStartPreview.Caption := 'Start Preview';
      mnuStartPreview.Tag := 0;
    end;

  if not FCaptureManager.IsRecording then
    begin
      bRecording := FCaptureManager.IsRecording;

      if bRecording then
        mnuStartRecording.Caption := 'Stop Recording'
      else
        mnuStartRecording.Caption := 'Start Recording';
    end;

  if FCaptureManager.IsPreviewing then
    begin
      bPreviewing := FCaptureManager.IsPreviewing;
      mnuStartPreview.Caption := 'Stop Preview';
      mnuStartPreview.Tag := 1;
      bEnableRecording := True;
      bEnablePhoto := True;
    end
  else if FCaptureManager.IsPhotoPending then
    bEnablePhoto := False
  else
    begin
      mnuStartPreview.Caption := 'Start Preview';
      mnuStartPreview.Tag := 0;
    end;

  if bRecording then
    pnlInfo.Caption := 'Recording'
  else if FCaptureManager.IsPreviewing then
    pnlInfo.Caption := 'Previewing'
  else
    begin
      bEnableRecording := False;
    end;

  mnuStartRecording.Enabled := bEnableRecording;
  mnuStartPreview.Enabled := bEnablePreview;
  pnlControls.Enabled := bEnablePhoto;
end;


// mnuStartPreviewClick
// Dont' call UpdateUI() when adressing the capture engine,
// this method will be called when the capture engine OnCaptureEvent is handled.
procedure TMainWindow.mnuStartPreviewClick(Sender: TObject);
var
  hr: HResult;

begin
  if Assigned(FCaptureManager) then
    begin
      if (mnuStartPreview.Tag = 0) then
        begin
          hr := FCaptureManager.StartPreview();
          if FAILED(hr) then
            begin
              butTakePhoto.Enabled := False;
              ErrMsg('mnuStartPreviewClick ' + ERR_PREVIEW,
                     hr);
              Exit;
            end;
          butSaveToFile.Enabled := False;
          butTakePhoto.Enabled := True;
          mnuStartPreview.Tag := 1;
        end
      else
        begin
          hr := FCaptureManager.StopPreview();
          mnuStartPreview.Tag := 0;
          if FAILED(hr) then
            ErrMsg('mnuStartPreviewClick ' + ERR_STOP_PREVIEW,
                   hr);
        end;
    end;
end;


// mnuStartRecordingClick
procedure TMainWindow.mnuStartRecordingClick(Sender: TObject);
begin
  FCaptureManager.StartRecording(nil);
end;


procedure TMainWindow.Exit1Click(Sender: TObject);
begin
  Close();
end;

end.
