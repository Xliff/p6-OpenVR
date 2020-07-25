use v6;

use OpenVR::Raw::Pre_Subs;

# cw: HAS to be our scoped and exported? -- Weird ness. Implicit package
#     dragons?
our %OPENVR-RAW-ENUMS-NEW-EXPORTS is export;
our $export-count = 0;

sub EXPORT {
  %OPENVR-RAW-ENUMS-NEW-EXPORTS.append( EXPORT::DEFAULT::.pairs )
    unless $export-count;
  $export-count++;
  %OPENVR-RAW-ENUMS-NEW-EXPORTS
}

unit package OpenVR::Raw::Enums;

constant ChaperoneCalibrationState is export := uint32;
our enum ChaperoneCalibrationStateEnum is export (
  ChaperoneCalibrationState_OK                              =>   1,
  ChaperoneCalibrationState_Warning                         => 100,
  ChaperoneCalibrationState_Warning_BaseStationMayHaveMoved => 101,
  ChaperoneCalibrationState_Warning_BaseStationRemoved      => 102,
  ChaperoneCalibrationState_Warning_SeatedBoundsInvalid     => 103,
  ChaperoneCalibrationState_Error                           => 200,
  ChaperoneCalibrationState_Error_BaseStationUninitialized  => 201,
  ChaperoneCalibrationState_Error_BaseStationConflict       => 202,
  ChaperoneCalibrationState_Error_PlayAreaInvalid           => 203,
  ChaperoneCalibrationState_Error_CollisionBoundsInvalid    => 204,
);

constant EAdditionalRadioFeatures is export := uint32;
our enum EAdditionalRadioFeaturesEnum is export (
  EAdditionalRadioFeatures_AdditionalRadioFeatures_None           => 0,
  EAdditionalRadioFeatures_AdditionalRadioFeatures_HTCLinkBox     => 1,
  EAdditionalRadioFeatures_AdditionalRadioFeatures_InternalDongle => 2,
  EAdditionalRadioFeatures_AdditionalRadioFeatures_ExternalDongle => 4,
);

constant EChaperoneConfigFile is export := uint32;
our enum EChaperoneConfigFileEnum is export (
  EChaperoneConfigFile_Live => 1,
  EChaperoneConfigFile_Temp => 2,
);

constant EChaperoneImportFlags is export := uint32;
our enum EChaperoneImportFlagsEnum is export (
  EChaperoneImportFlags_EChaperoneImport_BoundsOnly => 1,
);

constant ECollisionBoundsStyle is export := uint32;
our enum ECollisionBoundsStyleEnum is export (
  ECollisionBoundsStyle_COLLISION_BOUNDS_STYLE_BEGINNER     => 0,
  ECollisionBoundsStyle_COLLISION_BOUNDS_STYLE_INTERMEDIATE => 1,
  ECollisionBoundsStyle_COLLISION_BOUNDS_STYLE_SQUARES      => 2,
  ECollisionBoundsStyle_COLLISION_BOUNDS_STYLE_ADVANCED     => 3,
  ECollisionBoundsStyle_COLLISION_BOUNDS_STYLE_NONE         => 4,
  ECollisionBoundsStyle_COLLISION_BOUNDS_STYLE_COUNT        => 5,
);

constant EColorSpace is export := uint32;
our enum EColorSpaceEnum is export (
  EColorSpace_ColorSpace_Auto   => 0,
  EColorSpace_ColorSpace_Gamma  => 1,
  EColorSpace_ColorSpace_Linear => 2,
);

constant EDeviceActivityLevel is export := int32;
our enum EDeviceActivityLevelEnum is export (
  EDeviceActivityLevel_k_EDeviceActivityLevel_Unknown                 => -1,
  EDeviceActivityLevel_k_EDeviceActivityLevel_Idle                    =>  0,
  EDeviceActivityLevel_k_EDeviceActivityLevel_UserInteraction         =>  1,
  EDeviceActivityLevel_k_EDeviceActivityLevel_UserInteraction_Timeout =>  2,
  EDeviceActivityLevel_k_EDeviceActivityLevel_Standby                 =>  3,
  EDeviceActivityLevel_k_EDeviceActivityLevel_Idle_Timeout            =>  4,
);

constant EDualAnalogWhich is export := uint32;
our enum EDualAnalogWhichEnum is export (
  EDualAnalogWhich_k_EDualAnalog_Left  => 0,
  EDualAnalogWhich_k_EDualAnalog_Right => 1,
);

constant EGamepadTextInputLineMode is export := uint32;
our enum EGamepadTextInputLineModeEnum is export (
  EGamepadTextInputLineMode_k_EGamepadTextInputLineModeSingleLine    => 0,
  EGamepadTextInputLineMode_k_EGamepadTextInputLineModeMultipleLines => 1,
);

constant EGamepadTextInputMode is export := uint32;
our enum EGamepadTextInputModeEnum is export (
  EGamepadTextInputMode_k_EGamepadTextInputModeNormal   => 0,
  EGamepadTextInputMode_k_EGamepadTextInputModePassword => 1,
  EGamepadTextInputMode_k_EGamepadTextInputModeSubmit   => 2,
);

constant EHDCPError is export := uint32;
our enum EHDCPErrorEnum is export (
  EHDCPError_HDCPError_None          => 0,
  EHDCPError_HDCPError_LinkLost      => 1,
  EHDCPError_HDCPError_Tampered      => 2,
  EHDCPError_HDCPError_DeviceRevoked => 3,
  EHDCPError_HDCPError_Unknown       => 4,
);

constant EHiddenAreaMeshType is export := uint32;
our enum EHiddenAreaMeshTypeEnum is export (
  EHiddenAreaMeshType_k_eHiddenAreaMesh_Standard => 0,
  EHiddenAreaMeshType_k_eHiddenAreaMesh_Inverse  => 1,
  EHiddenAreaMeshType_k_eHiddenAreaMesh_LineLoop => 2,
  EHiddenAreaMeshType_k_eHiddenAreaMesh_Max      => 3,
);

constant EHmdTrackingStyle is export := uint32;
our enum EHmdTrackingStyleEnum is export (
  EHmdTrackingStyle_HmdTrackingStyle_Unknown          => 0,
  EHmdTrackingStyle_HmdTrackingStyle_Lighthouse       => 1,
  EHmdTrackingStyle_HmdTrackingStyle_OutsideInCameras => 2,
  EHmdTrackingStyle_HmdTrackingStyle_InsideOutCameras => 3,
);

constant EIOBufferError is export := uint32;
our enum EIOBufferErrorEnum is export (
  EIOBufferError_IOBuffer_Success          =>   0,
  EIOBufferError_IOBuffer_OperationFailed  => 100,
  EIOBufferError_IOBuffer_InvalidHandle    => 101,
  EIOBufferError_IOBuffer_InvalidArgument  => 102,
  EIOBufferError_IOBuffer_PathExists       => 103,
  EIOBufferError_IOBuffer_PathDoesNotExist => 104,
  EIOBufferError_IOBuffer_Permission       => 105,
);

constant EIOBufferMode is export := uint32;
our enum EIOBufferModeEnum is export (
  EIOBufferMode_IOBufferMode_Read   =>   1,
  EIOBufferMode_IOBufferMode_Write  =>   2,
  EIOBufferMode_IOBufferMode_Create => 512,
);

constant EShowUIType is export := uint32;
our enum EShowUITypeEnum is export (
  EShowUIType_ShowUI_ControllerBinding => 0,
  EShowUIType_ShowUI_ManageTrackers    => 1,
  EShowUIType_ShowUI_Pairing           => 3,
  EShowUIType_ShowUI_Settings          => 4,
  EShowUIType_ShowUI_DebugCommands     => 5,
);

constant ETextureType is export := int32;
our enum ETextureTypeEnum is export (
  ETextureType_TextureType_Invalid          => -1,
  ETextureType_TextureType_DirectX          =>  0,
  ETextureType_TextureType_OpenGL           =>  1,
  ETextureType_TextureType_Vulkan           =>  2,
  ETextureType_TextureType_IOSurface        =>  3,
  ETextureType_TextureType_DirectX12        =>  4,
  ETextureType_TextureType_DXGISharedHandle =>  5,
  ETextureType_TextureType_Metal            =>  6,
);

constant ETrackedControllerRole is export := uint32;
our enum ETrackedControllerRoleEnum is export (
  ETrackedControllerRole_TrackedControllerRole_Invalid   => 0,
  ETrackedControllerRole_TrackedControllerRole_LeftHand  => 1,
  ETrackedControllerRole_TrackedControllerRole_RightHand => 2,
  ETrackedControllerRole_TrackedControllerRole_OptOut    => 3,
  ETrackedControllerRole_TrackedControllerRole_Treadmill => 4,
  ETrackedControllerRole_TrackedControllerRole_Max       => 5,
);

constant ETrackedDeviceClass is export := uint32;
our enum ETrackedDeviceClassEnum is export (
  ETrackedDeviceClass_TrackedDeviceClass_Invalid           => 0,
  ETrackedDeviceClass_TrackedDeviceClass_HMD               => 1,
  ETrackedDeviceClass_TrackedDeviceClass_Controller        => 2,
  ETrackedDeviceClass_TrackedDeviceClass_GenericTracker    => 3,
  ETrackedDeviceClass_TrackedDeviceClass_TrackingReference => 4,
  ETrackedDeviceClass_TrackedDeviceClass_DisplayRedirect   => 5,
  ETrackedDeviceClass_TrackedDeviceClass_Max               => 6,
);

constant ETrackedDeviceProperty is export := uint32;
our enum ETrackedDevicePropertyEnum is export (
  ETrackedDeviceProperty_Prop_Invalid                                        =>       0,
  ETrackedDeviceProperty_Prop_TrackingSystemName_String                      =>    1000,
  ETrackedDeviceProperty_Prop_ModelNumber_String                             =>    1001,
  ETrackedDeviceProperty_Prop_SerialNumber_String                            =>    1002,
  ETrackedDeviceProperty_Prop_RenderModelName_String                         =>    1003,
  ETrackedDeviceProperty_Prop_WillDriftInYaw_Bool                            =>    1004,
  ETrackedDeviceProperty_Prop_ManufacturerName_String                        =>    1005,
  ETrackedDeviceProperty_Prop_TrackingFirmwareVersion_String                 =>    1006,
  ETrackedDeviceProperty_Prop_HardwareRevision_String                        =>    1007,
  ETrackedDeviceProperty_Prop_AllWirelessDongleDescriptions_String           =>    1008,
  ETrackedDeviceProperty_Prop_ConnectedWirelessDongle_String                 =>    1009,
  ETrackedDeviceProperty_Prop_DeviceIsWireless_Bool                          =>    1010,
  ETrackedDeviceProperty_Prop_DeviceIsCharging_Bool                          =>    1011,
  ETrackedDeviceProperty_Prop_DeviceBatteryPercentage_Float                  =>    1012,
  ETrackedDeviceProperty_Prop_StatusDisplayTransform_Matrix34                =>    1013,
  ETrackedDeviceProperty_Prop_Firmware_UpdateAvailable_Bool                  =>    1014,
  ETrackedDeviceProperty_Prop_Firmware_ManualUpdate_Bool                     =>    1015,
  ETrackedDeviceProperty_Prop_Firmware_ManualUpdateURL_String                =>    1016,
  ETrackedDeviceProperty_Prop_HardwareRevision_Uint64                        =>    1017,
  ETrackedDeviceProperty_Prop_FirmwareVersion_Uint64                         =>    1018,
  ETrackedDeviceProperty_Prop_FPGAVersion_Uint64                             =>    1019,
  ETrackedDeviceProperty_Prop_VRCVersion_Uint64                              =>    1020,
  ETrackedDeviceProperty_Prop_RadioVersion_Uint64                            =>    1021,
  ETrackedDeviceProperty_Prop_DongleVersion_Uint64                           =>    1022,
  ETrackedDeviceProperty_Prop_BlockServerShutdown_Bool                       =>    1023,
  ETrackedDeviceProperty_Prop_CanUnifyCoordinateSystemWithHmd_Bool           =>    1024,
  ETrackedDeviceProperty_Prop_ContainsProximitySensor_Bool                   =>    1025,
  ETrackedDeviceProperty_Prop_DeviceProvidesBatteryStatus_Bool               =>    1026,
  ETrackedDeviceProperty_Prop_DeviceCanPowerOff_Bool                         =>    1027,
  ETrackedDeviceProperty_Prop_Firmware_ProgrammingTarget_String              =>    1028,
  ETrackedDeviceProperty_Prop_DeviceClass_Int32                              =>    1029,
  ETrackedDeviceProperty_Prop_HasCamera_Bool                                 =>    1030,
  ETrackedDeviceProperty_Prop_DriverVersion_String                           =>    1031,
  ETrackedDeviceProperty_Prop_Firmware_ForceUpdateRequired_Bool              =>    1032,
  ETrackedDeviceProperty_Prop_ViveSystemButtonFixRequired_Bool               =>    1033,
  ETrackedDeviceProperty_Prop_ParentDriver_Uint64                            =>    1034,
  ETrackedDeviceProperty_Prop_ResourceRoot_String                            =>    1035,
  ETrackedDeviceProperty_Prop_RegisteredDeviceType_String                    =>    1036,
  ETrackedDeviceProperty_Prop_InputProfilePath_String                        =>    1037,
  ETrackedDeviceProperty_Prop_NeverTracked_Bool                              =>    1038,
  ETrackedDeviceProperty_Prop_NumCameras_Int32                               =>    1039,
  ETrackedDeviceProperty_Prop_CameraFrameLayout_Int32                        =>    1040,
  ETrackedDeviceProperty_Prop_CameraStreamFormat_Int32                       =>    1041,
  ETrackedDeviceProperty_Prop_AdditionalDeviceSettingsPath_String            =>    1042,
  ETrackedDeviceProperty_Prop_Identifiable_Bool                              =>    1043,
  ETrackedDeviceProperty_Prop_BootloaderVersion_Uint64                       =>    1044,
  ETrackedDeviceProperty_Prop_AdditionalSystemReportData_String              =>    1045,
  ETrackedDeviceProperty_Prop_CompositeFirmwareVersion_String                =>    1046,
  ETrackedDeviceProperty_Prop_Firmware_RemindUpdate_Bool                     =>    1047,
  ETrackedDeviceProperty_Prop_ReportsTimeSinceVSync_Bool                     =>    2000,
  ETrackedDeviceProperty_Prop_SecondsFromVsyncToPhotons_Float                =>    2001,
  ETrackedDeviceProperty_Prop_DisplayFrequency_Float                         =>    2002,
  ETrackedDeviceProperty_Prop_UserIpdMeters_Float                            =>    2003,
  ETrackedDeviceProperty_Prop_CurrentUniverseId_Uint64                       =>    2004,
  ETrackedDeviceProperty_Prop_PreviousUniverseId_Uint64                      =>    2005,
  ETrackedDeviceProperty_Prop_DisplayFirmwareVersion_Uint64                  =>    2006,
  ETrackedDeviceProperty_Prop_IsOnDesktop_Bool                               =>    2007,
  ETrackedDeviceProperty_Prop_DisplayMCType_Int32                            =>    2008,
  ETrackedDeviceProperty_Prop_DisplayMCOffset_Float                          =>    2009,
  ETrackedDeviceProperty_Prop_DisplayMCScale_Float                           =>    2010,
  ETrackedDeviceProperty_Prop_EdidVendorID_Int32                             =>    2011,
  ETrackedDeviceProperty_Prop_DisplayMCImageLeft_String                      =>    2012,
  ETrackedDeviceProperty_Prop_DisplayMCImageRight_String                     =>    2013,
  ETrackedDeviceProperty_Prop_DisplayGCBlackClamp_Float                      =>    2014,
  ETrackedDeviceProperty_Prop_EdidProductID_Int32                            =>    2015,
  ETrackedDeviceProperty_Prop_CameraToHeadTransform_Matrix34                 =>    2016,
  ETrackedDeviceProperty_Prop_DisplayGCType_Int32                            =>    2017,
  ETrackedDeviceProperty_Prop_DisplayGCOffset_Float                          =>    2018,
  ETrackedDeviceProperty_Prop_DisplayGCScale_Float                           =>    2019,
  ETrackedDeviceProperty_Prop_DisplayGCPrescale_Float                        =>    2020,
  ETrackedDeviceProperty_Prop_DisplayGCImage_String                          =>    2021,
  ETrackedDeviceProperty_Prop_LensCenterLeftU_Float                          =>    2022,
  ETrackedDeviceProperty_Prop_LensCenterLeftV_Float                          =>    2023,
  ETrackedDeviceProperty_Prop_LensCenterRightU_Float                         =>    2024,
  ETrackedDeviceProperty_Prop_LensCenterRightV_Float                         =>    2025,
  ETrackedDeviceProperty_Prop_UserHeadToEyeDepthMeters_Float                 =>    2026,
  ETrackedDeviceProperty_Prop_CameraFirmwareVersion_Uint64                   =>    2027,
  ETrackedDeviceProperty_Prop_CameraFirmwareDescription_String               =>    2028,
  ETrackedDeviceProperty_Prop_DisplayFPGAVersion_Uint64                      =>    2029,
  ETrackedDeviceProperty_Prop_DisplayBootloaderVersion_Uint64                =>    2030,
  ETrackedDeviceProperty_Prop_DisplayHardwareVersion_Uint64                  =>    2031,
  ETrackedDeviceProperty_Prop_AudioFirmwareVersion_Uint64                    =>    2032,
  ETrackedDeviceProperty_Prop_CameraCompatibilityMode_Int32                  =>    2033,
  ETrackedDeviceProperty_Prop_ScreenshotHorizontalFieldOfViewDegrees_Float   =>    2034,
  ETrackedDeviceProperty_Prop_ScreenshotVerticalFieldOfViewDegrees_Float     =>    2035,
  ETrackedDeviceProperty_Prop_DisplaySuppressed_Bool                         =>    2036,
  ETrackedDeviceProperty_Prop_DisplayAllowNightMode_Bool                     =>    2037,
  ETrackedDeviceProperty_Prop_DisplayMCImageWidth_Int32                      =>    2038,
  ETrackedDeviceProperty_Prop_DisplayMCImageHeight_Int32                     =>    2039,
  ETrackedDeviceProperty_Prop_DisplayMCImageNumChannels_Int32                =>    2040,
  ETrackedDeviceProperty_Prop_DisplayMCImageData_Binary                      =>    2041,
  ETrackedDeviceProperty_Prop_SecondsFromPhotonsToVblank_Float               =>    2042,
  ETrackedDeviceProperty_Prop_DriverDirectModeSendsVsyncEvents_Bool          =>    2043,
  ETrackedDeviceProperty_Prop_DisplayDebugMode_Bool                          =>    2044,
  ETrackedDeviceProperty_Prop_GraphicsAdapterLuid_Uint64                     =>    2045,
  ETrackedDeviceProperty_Prop_DriverProvidedChaperonePath_String             =>    2048,
  ETrackedDeviceProperty_Prop_ExpectedTrackingReferenceCount_Int32           =>    2049,
  ETrackedDeviceProperty_Prop_ExpectedControllerCount_Int32                  =>    2050,
  ETrackedDeviceProperty_Prop_NamedIconPathControllerLeftDeviceOff_String    =>    2051,
  ETrackedDeviceProperty_Prop_NamedIconPathControllerRightDeviceOff_String   =>    2052,
  ETrackedDeviceProperty_Prop_NamedIconPathTrackingReferenceDeviceOff_String =>    2053,
  ETrackedDeviceProperty_Prop_DoNotApplyPrediction_Bool                      =>    2054,
  ETrackedDeviceProperty_Prop_CameraToHeadTransforms_Matrix34_Array          =>    2055,
  ETrackedDeviceProperty_Prop_DistortionMeshResolution_Int32                 =>    2056,
  ETrackedDeviceProperty_Prop_DriverIsDrawingControllers_Bool                =>    2057,
  ETrackedDeviceProperty_Prop_DriverRequestsApplicationPause_Bool            =>    2058,
  ETrackedDeviceProperty_Prop_DriverRequestsReducedRendering_Bool            =>    2059,
  ETrackedDeviceProperty_Prop_MinimumIpdStepMeters_Float                     =>    2060,
  ETrackedDeviceProperty_Prop_AudioBridgeFirmwareVersion_Uint64              =>    2061,
  ETrackedDeviceProperty_Prop_ImageBridgeFirmwareVersion_Uint64              =>    2062,
  ETrackedDeviceProperty_Prop_ImuToHeadTransform_Matrix34                    =>    2063,
  ETrackedDeviceProperty_Prop_ImuFactoryGyroBias_Vector3                     =>    2064,
  ETrackedDeviceProperty_Prop_ImuFactoryGyroScale_Vector3                    =>    2065,
  ETrackedDeviceProperty_Prop_ImuFactoryAccelerometerBias_Vector3            =>    2066,
  ETrackedDeviceProperty_Prop_ImuFactoryAccelerometerScale_Vector3           =>    2067,
  ETrackedDeviceProperty_Prop_ConfigurationIncludesLighthouse20Features_Bool =>    2069,
  ETrackedDeviceProperty_Prop_AdditionalRadioFeatures_Uint64                 =>    2070,
  ETrackedDeviceProperty_Prop_CameraWhiteBalance_Vector4_Array               =>    2071,
  ETrackedDeviceProperty_Prop_CameraDistortionFunction_Int32_Array           =>    2072,
  ETrackedDeviceProperty_Prop_CameraDistortionCoefficients_Float_Array       =>    2073,
  ETrackedDeviceProperty_Prop_ExpectedControllerType_String                  =>    2074,
  ETrackedDeviceProperty_Prop_HmdTrackingStyle_Int32                         =>    2075,
  ETrackedDeviceProperty_Prop_DriverProvidedChaperoneVisibility_Bool         =>    2076,
  ETrackedDeviceProperty_Prop_HmdProvidesDisplaySettings_Bool                =>    2077,
  ETrackedDeviceProperty_Prop_DisplayAvailableFrameRates_Float_Array         =>    2080,
  ETrackedDeviceProperty_Prop_DisplaySupportsMultipleFramerates_Bool         =>    2081,
  ETrackedDeviceProperty_Prop_DisplayColorMultLeft_Vector3                   =>    2082,
  ETrackedDeviceProperty_Prop_DisplayColorMultRight_Vector3                  =>    2083,
  ETrackedDeviceProperty_Prop_DashboardLayoutPathName_String                 =>    2090,
  ETrackedDeviceProperty_Prop_DashboardScale_Float                           =>    2091,
  ETrackedDeviceProperty_Prop_IpdUIRangeMinMeters_Float                      =>    2100,
  ETrackedDeviceProperty_Prop_IpdUIRangeMaxMeters_Float                      =>    2101,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraCorrectionMode_Int32        =>    2200,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_InnerLeft_Int32     =>    2201,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_InnerRight_Int32    =>    2202,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_InnerTop_Int32      =>    2203,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_InnerBottom_Int32   =>    2204,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_OuterLeft_Int32     =>    2205,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_OuterRight_Int32    =>    2206,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_OuterTop_Int32      =>    2207,
  ETrackedDeviceProperty_Prop_DriverRequestedMuraFeather_OuterBottom_Int32   =>    2208,
  ETrackedDeviceProperty_Prop_Audio_DefaultPlaybackDeviceId_String           =>    2300,
  ETrackedDeviceProperty_Prop_Audio_DefaultRecordingDeviceId_String          =>    2301,
  ETrackedDeviceProperty_Prop_Audio_DefaultPlaybackDeviceVolume_Float        =>    2302,
  ETrackedDeviceProperty_Prop_AttachedDeviceId_String                        =>    3000,
  ETrackedDeviceProperty_Prop_SupportedButtons_Uint64                        =>    3001,
  ETrackedDeviceProperty_Prop_Axis0Type_Int32                                =>    3002,
  ETrackedDeviceProperty_Prop_Axis1Type_Int32                                =>    3003,
  ETrackedDeviceProperty_Prop_Axis2Type_Int32                                =>    3004,
  ETrackedDeviceProperty_Prop_Axis3Type_Int32                                =>    3005,
  ETrackedDeviceProperty_Prop_Axis4Type_Int32                                =>    3006,
  ETrackedDeviceProperty_Prop_ControllerRoleHint_Int32                       =>    3007,
  ETrackedDeviceProperty_Prop_FieldOfViewLeftDegrees_Float                   =>    4000,
  ETrackedDeviceProperty_Prop_FieldOfViewRightDegrees_Float                  =>    4001,
  ETrackedDeviceProperty_Prop_FieldOfViewTopDegrees_Float                    =>    4002,
  ETrackedDeviceProperty_Prop_FieldOfViewBottomDegrees_Float                 =>    4003,
  ETrackedDeviceProperty_Prop_TrackingRangeMinimumMeters_Float               =>    4004,
  ETrackedDeviceProperty_Prop_TrackingRangeMaximumMeters_Float               =>    4005,
  ETrackedDeviceProperty_Prop_ModeLabel_String                               =>    4006,
  ETrackedDeviceProperty_Prop_CanWirelessIdentify_Bool                       =>    4007,
  ETrackedDeviceProperty_Prop_Nonce_Int32                                    =>    4008,
  ETrackedDeviceProperty_Prop_IconPathName_String                            =>    5000,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceOff_String                  =>    5001,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceSearching_String            =>    5002,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceSearchingAlert_String       =>    5003,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceReady_String                =>    5004,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceReadyAlert_String           =>    5005,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceNotReady_String             =>    5006,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceStandby_String              =>    5007,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceAlertLow_String             =>    5008,
  ETrackedDeviceProperty_Prop_NamedIconPathDeviceStandbyAlert_String         =>    5009,
  ETrackedDeviceProperty_Prop_DisplayHiddenArea_Binary_Start                 =>    5100,
  ETrackedDeviceProperty_Prop_DisplayHiddenArea_Binary_End                   =>    5150,
  ETrackedDeviceProperty_Prop_ParentContainer                                =>    5151,
  ETrackedDeviceProperty_Prop_OverrideContainer_Uint64                       =>    5152,
  ETrackedDeviceProperty_Prop_UserConfigPath_String                          =>    6000,
  ETrackedDeviceProperty_Prop_InstallPath_String                             =>    6001,
  ETrackedDeviceProperty_Prop_HasDisplayComponent_Bool                       =>    6002,
  ETrackedDeviceProperty_Prop_HasControllerComponent_Bool                    =>    6003,
  ETrackedDeviceProperty_Prop_HasCameraComponent_Bool                        =>    6004,
  ETrackedDeviceProperty_Prop_HasDriverDirectModeComponent_Bool              =>    6005,
  ETrackedDeviceProperty_Prop_HasVirtualDisplayComponent_Bool                =>    6006,
  ETrackedDeviceProperty_Prop_HasSpatialAnchorsSupport_Bool                  =>    6007,
  ETrackedDeviceProperty_Prop_ControllerType_String                          =>    7000,
  ETrackedDeviceProperty_Prop_ControllerHandSelectionPriority_Int32          =>    7002,
  ETrackedDeviceProperty_Prop_VendorSpecific_Reserved_Start                  =>   10000,
  ETrackedDeviceProperty_Prop_VendorSpecific_Reserved_End                    =>   10999,
  ETrackedDeviceProperty_Prop_TrackedDeviceProperty_Max                      => 1000000,
);

constant ETrackedPropertyError is export := uint32;
our enum ETrackedPropertyErrorEnum is export (
  ETrackedPropertyError_TrackedProp_Success                    =>  0,
  ETrackedPropertyError_TrackedProp_WrongDataType              =>  1,
  ETrackedPropertyError_TrackedProp_WrongDeviceClass           =>  2,
  ETrackedPropertyError_TrackedProp_BufferTooSmall             =>  3,
  ETrackedPropertyError_TrackedProp_UnknownProperty            =>  4,
  ETrackedPropertyError_TrackedProp_InvalidDevice              =>  5,
  ETrackedPropertyError_TrackedProp_CouldNotContactServer      =>  6,
  ETrackedPropertyError_TrackedProp_ValueNotProvidedByDevice   =>  7,
  ETrackedPropertyError_TrackedProp_StringExceedsMaximumLength =>  8,
  ETrackedPropertyError_TrackedProp_NotYetAvailable            =>  9,
  ETrackedPropertyError_TrackedProp_PermissionDenied           => 10,
  ETrackedPropertyError_TrackedProp_InvalidOperation           => 11,
  ETrackedPropertyError_TrackedProp_CannotWriteToWildcards     => 12,
  ETrackedPropertyError_TrackedProp_IPCReadFailure             => 13,
);

constant ETrackingResult is export := uint32;
our enum ETrackingResultEnum is export (
  ETrackingResult_TrackingResult_Uninitialized          =>   1,
  ETrackingResult_TrackingResult_Calibrating_InProgress => 100,
  ETrackingResult_TrackingResult_Calibrating_OutOfRange => 101,
  ETrackingResult_TrackingResult_Running_OK             => 200,
  ETrackingResult_TrackingResult_Running_OutOfRange     => 201,
  ETrackingResult_TrackingResult_Fallback_RotationOnly  => 300,
);

constant ETrackingUniverseOrigin is export := uint32;
our enum ETrackingUniverseOriginEnum is export (
  ETrackingUniverseOrigin_TrackingUniverseSeated             => 0,
  ETrackingUniverseOrigin_TrackingUniverseStanding           => 1,
  ETrackingUniverseOrigin_TrackingUniverseRawAndUncalibrated => 2,
);

constant EVRApplicationError is export := uint32;
our enum EVRApplicationErrorEnum is export (
  EVRApplicationError_VRApplicationError_None                       =>   0,
  EVRApplicationError_VRApplicationError_AppKeyAlreadyExists        => 100,
  EVRApplicationError_VRApplicationError_NoManifest                 => 101,
  EVRApplicationError_VRApplicationError_NoApplication              => 102,
  EVRApplicationError_VRApplicationError_InvalidIndex               => 103,
  EVRApplicationError_VRApplicationError_UnknownApplication         => 104,
  EVRApplicationError_VRApplicationError_IPCFailed                  => 105,
  EVRApplicationError_VRApplicationError_ApplicationAlreadyRunning  => 106,
  EVRApplicationError_VRApplicationError_InvalidManifest            => 107,
  EVRApplicationError_VRApplicationError_InvalidApplication         => 108,
  EVRApplicationError_VRApplicationError_LaunchFailed               => 109,
  EVRApplicationError_VRApplicationError_ApplicationAlreadyStarting => 110,
  EVRApplicationError_VRApplicationError_LaunchInProgress           => 111,
  EVRApplicationError_VRApplicationError_OldApplicationQuitting     => 112,
  EVRApplicationError_VRApplicationError_TransitionAborted          => 113,
  EVRApplicationError_VRApplicationError_IsTemplate                 => 114,
  EVRApplicationError_VRApplicationError_SteamVRIsExiting           => 115,
  EVRApplicationError_VRApplicationError_BufferTooSmall             => 200,
  EVRApplicationError_VRApplicationError_PropertyNotSet             => 201,
  EVRApplicationError_VRApplicationError_UnknownProperty            => 202,
  EVRApplicationError_VRApplicationError_InvalidParameter           => 203,
);

constant EVRApplicationProperty is export := uint32;
our enum EVRApplicationPropertyEnum is export (
  EVRApplicationProperty_VRApplicationProperty_Name_String                        =>  0,
  EVRApplicationProperty_VRApplicationProperty_LaunchType_String                  => 11,
  EVRApplicationProperty_VRApplicationProperty_WorkingDirectory_String            => 12,
  EVRApplicationProperty_VRApplicationProperty_BinaryPath_String                  => 13,
  EVRApplicationProperty_VRApplicationProperty_Arguments_String                   => 14,
  EVRApplicationProperty_VRApplicationProperty_URL_String                         => 15,
  EVRApplicationProperty_VRApplicationProperty_Description_String                 => 50,
  EVRApplicationProperty_VRApplicationProperty_NewsURL_String                     => 51,
  EVRApplicationProperty_VRApplicationProperty_ImagePath_String                   => 52,
  EVRApplicationProperty_VRApplicationProperty_Source_String                      => 53,
  EVRApplicationProperty_VRApplicationProperty_ActionManifestURL_String           => 54,
  EVRApplicationProperty_VRApplicationProperty_IsDashboardOverlay_Bool            => 60,
  EVRApplicationProperty_VRApplicationProperty_IsTemplate_Bool                    => 61,
  EVRApplicationProperty_VRApplicationProperty_IsInstanced_Bool                   => 62,
  EVRApplicationProperty_VRApplicationProperty_IsInternal_Bool                    => 63,
  EVRApplicationProperty_VRApplicationProperty_WantsCompositorPauseInStandby_Bool => 64,
  EVRApplicationProperty_VRApplicationProperty_IsHidden_Bool                      => 65,
  EVRApplicationProperty_VRApplicationProperty_LastLaunchTime_Uint64              => 70,
);

constant EVRApplicationType is export := uint32;
our enum EVRApplicationTypeEnum is export (
  EVRApplicationType_VRApplication_Other         => 0,
  EVRApplicationType_VRApplication_Scene         => 1,
  EVRApplicationType_VRApplication_Overlay       => 2,
  EVRApplicationType_VRApplication_Background    => 3,
  EVRApplicationType_VRApplication_Utility       => 4,
  EVRApplicationType_VRApplication_VRMonitor     => 5,
  EVRApplicationType_VRApplication_SteamWatchdog => 6,
  EVRApplicationType_VRApplication_Bootstrapper  => 7,
  EVRApplicationType_VRApplication_WebHelper     => 8,
  EVRApplicationType_VRApplication_Max           => 9,
);

constant EVRButtonId is export := uint32;
our enum EVRButtonIdEnum is export (
  EVRButtonId_k_EButton_System                   =>  0,
  EVRButtonId_k_EButton_ApplicationMenu          =>  1,
  EVRButtonId_k_EButton_Grip                     =>  2,
  EVRButtonId_k_EButton_DPad_Left                =>  3,
  EVRButtonId_k_EButton_DPad_Up                  =>  4,
  EVRButtonId_k_EButton_DPad_Right               =>  5,
  EVRButtonId_k_EButton_DPad_Down                =>  6,
  EVRButtonId_k_EButton_A                        =>  7,
  EVRButtonId_k_EButton_ProximitySensor          => 31,
  EVRButtonId_k_EButton_Axis0                    => 32,
  EVRButtonId_k_EButton_Axis1                    => 33,
  EVRButtonId_k_EButton_Axis2                    => 34,
  EVRButtonId_k_EButton_Axis3                    => 35,
  EVRButtonId_k_EButton_Axis4                    => 36,
  EVRButtonId_k_EButton_SteamVR_Touchpad         => 32,
  EVRButtonId_k_EButton_SteamVR_Trigger          => 33,
  EVRButtonId_k_EButton_Dashboard_Back           =>  2,
  EVRButtonId_k_EButton_IndexController_A        =>  2,
  EVRButtonId_k_EButton_IndexController_B        =>  1,
  EVRButtonId_k_EButton_IndexController_JoyStick => 35,
  EVRButtonId_k_EButton_Max                      => 64,
);

constant EVRComponentProperty is export := uint32;
our enum EVRComponentPropertyEnum is export (
  EVRComponentProperty_VRComponentProperty_IsStatic   =>  1,
  EVRComponentProperty_VRComponentProperty_IsVisible  =>  2,
  EVRComponentProperty_VRComponentProperty_IsTouched  =>  4,
  EVRComponentProperty_VRComponentProperty_IsPressed  =>  8,
  EVRComponentProperty_VRComponentProperty_IsScrolled => 16,
);

constant EVRCompositorError is export := uint32;
our enum EVRCompositorErrorEnum is export (
  EVRCompositorError_VRCompositorError_None                         =>   0,
  EVRCompositorError_VRCompositorError_RequestFailed                =>   1,
  EVRCompositorError_VRCompositorError_IncompatibleVersion          => 100,
  EVRCompositorError_VRCompositorError_DoNotHaveFocus               => 101,
  EVRCompositorError_VRCompositorError_InvalidTexture               => 102,
  EVRCompositorError_VRCompositorError_IsNotSceneApplication        => 103,
  EVRCompositorError_VRCompositorError_TextureIsOnWrongDevice       => 104,
  EVRCompositorError_VRCompositorError_TextureUsesUnsupportedFormat => 105,
  EVRCompositorError_VRCompositorError_SharedTexturesNotSupported   => 106,
  EVRCompositorError_VRCompositorError_IndexOutOfRange              => 107,
  EVRCompositorError_VRCompositorError_AlreadySubmitted             => 108,
  EVRCompositorError_VRCompositorError_InvalidBounds                => 109,
);

constant EVRCompositorTimingMode is export := uint32;
our enum EVRCompositorTimingModeEnum is export (
  EVRCompositorTimingMode_VRCompositorTimingMode_Implicit                                       => 0,
  EVRCompositorTimingMode_VRCompositorTimingMode_Explicit_RuntimePerformsPostPresentHandoff     => 1,
  EVRCompositorTimingMode_VRCompositorTimingMode_Explicit_ApplicationPerformsPostPresentHandoff => 2,
);

constant EVRControllerAxisType is export := uint32;
our enum EVRControllerAxisTypeEnum is export (
  EVRControllerAxisType_k_eControllerAxis_None     => 0,
  EVRControllerAxisType_k_eControllerAxis_TrackPad => 1,
  EVRControllerAxisType_k_eControllerAxis_Joystick => 2,
  EVRControllerAxisType_k_eControllerAxis_Trigger  => 3,
);

constant EVRControllerEventOutputType is export := uint32;
our enum EVRControllerEventOutputTypeEnum is export (
  EVRControllerEventOutputType_ControllerEventOutput_OSEvents => 0,
  EVRControllerEventOutputType_ControllerEventOutput_VREvents => 1,
);

constant EVRDebugError is export := uint32;
our enum EVRDebugErrorEnum is export (
  EVRDebugError_VRDebugError_Success      => 0,
  EVRDebugError_VRDebugError_BadParameter => 1,
);

constant EVRDistortionFunctionType is export := uint32;
our enum EVRDistortionFunctionTypeEnum is export (
  EVRDistortionFunctionType_VRDistortionFunctionType_None            => 0,
  EVRDistortionFunctionType_VRDistortionFunctionType_FTheta          => 1,
  EVRDistortionFunctionType_VRDistortionFunctionType_Extended_FTheta => 2,
  EVRDistortionFunctionType_MAX_DISTORTION_FUNCTION_TYPES            => 3,
);

constant EVREventType is export := uint32;
our enum EVREventTypeEnum is export (
  EVREventType_VREvent_None                                      =>     0,
  EVREventType_VREvent_TrackedDeviceActivated                    =>   100,
  EVREventType_VREvent_TrackedDeviceDeactivated                  =>   101,
  EVREventType_VREvent_TrackedDeviceUpdated                      =>   102,
  EVREventType_VREvent_TrackedDeviceUserInteractionStarted       =>   103,
  EVREventType_VREvent_TrackedDeviceUserInteractionEnded         =>   104,
  EVREventType_VREvent_IpdChanged                                =>   105,
  EVREventType_VREvent_EnterStandbyMode                          =>   106,
  EVREventType_VREvent_LeaveStandbyMode                          =>   107,
  EVREventType_VREvent_TrackedDeviceRoleChanged                  =>   108,
  EVREventType_VREvent_WatchdogWakeUpRequested                   =>   109,
  EVREventType_VREvent_LensDistortionChanged                     =>   110,
  EVREventType_VREvent_PropertyChanged                           =>   111,
  EVREventType_VREvent_WirelessDisconnect                        =>   112,
  EVREventType_VREvent_WirelessReconnect                         =>   113,
  EVREventType_VREvent_ButtonPress                               =>   200,
  EVREventType_VREvent_ButtonUnpress                             =>   201,
  EVREventType_VREvent_ButtonTouch                               =>   202,
  EVREventType_VREvent_ButtonUntouch                             =>   203,
  EVREventType_VREvent_DualAnalog_Press                          =>   250,
  EVREventType_VREvent_DualAnalog_Unpress                        =>   251,
  EVREventType_VREvent_DualAnalog_Touch                          =>   252,
  EVREventType_VREvent_DualAnalog_Untouch                        =>   253,
  EVREventType_VREvent_DualAnalog_Move                           =>   254,
  EVREventType_VREvent_DualAnalog_ModeSwitch1                    =>   255,
  EVREventType_VREvent_DualAnalog_ModeSwitch2                    =>   256,
  EVREventType_VREvent_DualAnalog_Cancel                         =>   257,
  EVREventType_VREvent_MouseMove                                 =>   300,
  EVREventType_VREvent_MouseButtonDown                           =>   301,
  EVREventType_VREvent_MouseButtonUp                             =>   302,
  EVREventType_VREvent_FocusEnter                                =>   303,
  EVREventType_VREvent_FocusLeave                                =>   304,
  EVREventType_VREvent_ScrollDiscrete                            =>   305,
  EVREventType_VREvent_TouchPadMove                              =>   306,
  EVREventType_VREvent_OverlayFocusChanged                       =>   307,
  EVREventType_VREvent_ReloadOverlays                            =>   308,
  EVREventType_VREvent_ScrollSmooth                              =>   309,
  EVREventType_VREvent_InputFocusCaptured                        =>   400,
  EVREventType_VREvent_InputFocusReleased                        =>   401,
  EVREventType_VREvent_SceneApplicationChanged                   =>   404,
  EVREventType_VREvent_SceneFocusChanged                         =>   405,
  EVREventType_VREvent_InputFocusChanged                         =>   406,
  EVREventType_VREvent_SceneApplicationUsingWrongGraphicsAdapter =>   408,
  EVREventType_VREvent_ActionBindingReloaded                     =>   409,
  EVREventType_VREvent_HideRenderModels                          =>   410,
  EVREventType_VREvent_ShowRenderModels                          =>   411,
  EVREventType_VREvent_SceneApplicationStateChanged              =>   412,
  EVREventType_VREvent_ConsoleOpened                             =>   420,
  EVREventType_VREvent_ConsoleClosed                             =>   421,
  EVREventType_VREvent_OverlayShown                              =>   500,
  EVREventType_VREvent_OverlayHidden                             =>   501,
  EVREventType_VREvent_DashboardActivated                        =>   502,
  EVREventType_VREvent_DashboardDeactivated                      =>   503,
  EVREventType_VREvent_DashboardRequested                        =>   505,
  EVREventType_VREvent_ResetDashboard                            =>   506,
  EVREventType_VREvent_RenderToast                               =>   507,
  EVREventType_VREvent_ImageLoaded                               =>   508,
  EVREventType_VREvent_ShowKeyboard                              =>   509,
  EVREventType_VREvent_HideKeyboard                              =>   510,
  EVREventType_VREvent_OverlayGamepadFocusGained                 =>   511,
  EVREventType_VREvent_OverlayGamepadFocusLost                   =>   512,
  EVREventType_VREvent_OverlaySharedTextureChanged               =>   513,
  EVREventType_VREvent_ScreenshotTriggered                       =>   516,
  EVREventType_VREvent_ImageFailed                               =>   517,
  EVREventType_VREvent_DashboardOverlayCreated                   =>   518,
  EVREventType_VREvent_SwitchGamepadFocus                        =>   519,
  EVREventType_VREvent_RequestScreenshot                         =>   520,
  EVREventType_VREvent_ScreenshotTaken                           =>   521,
  EVREventType_VREvent_ScreenshotFailed                          =>   522,
  EVREventType_VREvent_SubmitScreenshotToDashboard               =>   523,
  EVREventType_VREvent_ScreenshotProgressToDashboard             =>   524,
  EVREventType_VREvent_PrimaryDashboardDeviceChanged             =>   525,
  EVREventType_VREvent_RoomViewShown                             =>   526,
  EVREventType_VREvent_RoomViewHidden                            =>   527,
  EVREventType_VREvent_ShowUI                                    =>   528,
  EVREventType_VREvent_ShowDevTools                              =>   529,
  EVREventType_VREvent_Notification_Shown                        =>   600,
  EVREventType_VREvent_Notification_Hidden                       =>   601,
  EVREventType_VREvent_Notification_BeginInteraction             =>   602,
  EVREventType_VREvent_Notification_Destroyed                    =>   603,
  EVREventType_VREvent_Quit                                      =>   700,
  EVREventType_VREvent_ProcessQuit                               =>   701,
  EVREventType_VREvent_QuitAcknowledged                          =>   703,
  EVREventType_VREvent_DriverRequestedQuit                       =>   704,
  EVREventType_VREvent_RestartRequested                          =>   705,
  EVREventType_VREvent_ChaperoneDataHasChanged                   =>   800,
  EVREventType_VREvent_ChaperoneUniverseHasChanged               =>   801,
  EVREventType_VREvent_ChaperoneTempDataHasChanged               =>   802,
  EVREventType_VREvent_ChaperoneSettingsHaveChanged              =>   803,
  EVREventType_VREvent_SeatedZeroPoseReset                       =>   804,
  EVREventType_VREvent_ChaperoneFlushCache                       =>   805,
  EVREventType_VREvent_ChaperoneRoomSetupStarting                =>   806,
  EVREventType_VREvent_ChaperoneRoomSetupFinished                =>   807,
  EVREventType_VREvent_AudioSettingsHaveChanged                  =>   820,
  EVREventType_VREvent_BackgroundSettingHasChanged               =>   850,
  EVREventType_VREvent_CameraSettingsHaveChanged                 =>   851,
  EVREventType_VREvent_ReprojectionSettingHasChanged             =>   852,
  EVREventType_VREvent_ModelSkinSettingsHaveChanged              =>   853,
  EVREventType_VREvent_EnvironmentSettingsHaveChanged            =>   854,
  EVREventType_VREvent_PowerSettingsHaveChanged                  =>   855,
  EVREventType_VREvent_EnableHomeAppSettingsHaveChanged          =>   856,
  EVREventType_VREvent_SteamVRSectionSettingChanged              =>   857,
  EVREventType_VREvent_LighthouseSectionSettingChanged           =>   858,
  EVREventType_VREvent_NullSectionSettingChanged                 =>   859,
  EVREventType_VREvent_UserInterfaceSectionSettingChanged        =>   860,
  EVREventType_VREvent_NotificationsSectionSettingChanged        =>   861,
  EVREventType_VREvent_KeyboardSectionSettingChanged             =>   862,
  EVREventType_VREvent_PerfSectionSettingChanged                 =>   863,
  EVREventType_VREvent_DashboardSectionSettingChanged            =>   864,
  EVREventType_VREvent_WebInterfaceSectionSettingChanged         =>   865,
  EVREventType_VREvent_TrackersSectionSettingChanged             =>   866,
  EVREventType_VREvent_LastKnownSectionSettingChanged            =>   867,
  EVREventType_VREvent_DismissedWarningsSectionSettingChanged    =>   868,
  EVREventType_VREvent_StatusUpdate                              =>   900,
  EVREventType_VREvent_WebInterface_InstallDriverCompleted       =>   950,
  EVREventType_VREvent_MCImageUpdated                            =>  1000,
  EVREventType_VREvent_FirmwareUpdateStarted                     =>  1100,
  EVREventType_VREvent_FirmwareUpdateFinished                    =>  1101,
  EVREventType_VREvent_KeyboardClosed                            =>  1200,
  EVREventType_VREvent_KeyboardCharInput                         =>  1201,
  EVREventType_VREvent_KeyboardDone                              =>  1202,
  EVREventType_VREvent_ApplicationListUpdated                    =>  1303,
  EVREventType_VREvent_ApplicationMimeTypeLoad                   =>  1304,
  EVREventType_VREvent_ProcessConnected                          =>  1306,
  EVREventType_VREvent_ProcessDisconnected                       =>  1307,
  EVREventType_VREvent_Compositor_ChaperoneBoundsShown           =>  1410,
  EVREventType_VREvent_Compositor_ChaperoneBoundsHidden          =>  1411,
  EVREventType_VREvent_Compositor_DisplayDisconnected            =>  1412,
  EVREventType_VREvent_Compositor_DisplayReconnected             =>  1413,
  EVREventType_VREvent_Compositor_HDCPError                      =>  1414,
  EVREventType_VREvent_Compositor_ApplicationNotResponding       =>  1415,
  EVREventType_VREvent_Compositor_ApplicationResumed             =>  1416,
  EVREventType_VREvent_Compositor_OutOfVideoMemory               =>  1417,
  EVREventType_VREvent_Compositor_DisplayModeNotSupported        =>  1418,
  EVREventType_VREvent_TrackedCamera_StartVideoStream            =>  1500,
  EVREventType_VREvent_TrackedCamera_StopVideoStream             =>  1501,
  EVREventType_VREvent_TrackedCamera_PauseVideoStream            =>  1502,
  EVREventType_VREvent_TrackedCamera_ResumeVideoStream           =>  1503,
  EVREventType_VREvent_TrackedCamera_EditingSurface              =>  1550,
  EVREventType_VREvent_PerformanceTest_EnableCapture             =>  1600,
  EVREventType_VREvent_PerformanceTest_DisableCapture            =>  1601,
  EVREventType_VREvent_PerformanceTest_FidelityLevel             =>  1602,
  EVREventType_VREvent_MessageOverlay_Closed                     =>  1650,
  EVREventType_VREvent_MessageOverlayCloseRequested              =>  1651,
  EVREventType_VREvent_Input_HapticVibration                     =>  1700,
  EVREventType_VREvent_Input_BindingLoadFailed                   =>  1701,
  EVREventType_VREvent_Input_BindingLoadSuccessful               =>  1702,
  EVREventType_VREvent_Input_ActionManifestReloaded              =>  1703,
  EVREventType_VREvent_Input_ActionManifestLoadFailed            =>  1704,
  EVREventType_VREvent_Input_ProgressUpdate                      =>  1705,
  EVREventType_VREvent_Input_TrackerActivated                    =>  1706,
  EVREventType_VREvent_Input_BindingsUpdated                     =>  1707,
  EVREventType_VREvent_SpatialAnchors_PoseUpdated                =>  1800,
  EVREventType_VREvent_SpatialAnchors_DescriptorUpdated          =>  1801,
  EVREventType_VREvent_SpatialAnchors_RequestPoseUpdate          =>  1802,
  EVREventType_VREvent_SpatialAnchors_RequestDescriptorUpdate    =>  1803,
  EVREventType_VREvent_SystemReport_Started                      =>  1900,
  EVREventType_VREvent_Monitor_ShowHeadsetView                   =>  2000,
  EVREventType_VREvent_Monitor_HideHeadsetView                   =>  2001,
  EVREventType_VREvent_VendorSpecific_Reserved_Start             => 10000,
  EVREventType_VREvent_VendorSpecific_Reserved_End               => 19999,
);

constant EVREye is export := uint32;
our enum EVREyeEnum is export (
  EVREye_Eye_Left  => 0,
  EVREye_Eye_Right => 1,
);

constant EVRFinger is export := uint32;
our enum EVRFingerEnum is export (
  EVRFinger_VRFinger_Thumb  => 0,
  EVRFinger_VRFinger_Index  => 1,
  EVRFinger_VRFinger_Middle => 2,
  EVRFinger_VRFinger_Ring   => 3,
  EVRFinger_VRFinger_Pinky  => 4,
  EVRFinger_VRFinger_Count  => 5,
);

constant EVRFingerSplay is export := uint32;
our enum EVRFingerSplayEnum is export (
  EVRFingerSplay_VRFingerSplay_Thumb_Index  => 0,
  EVRFingerSplay_VRFingerSplay_Index_Middle => 1,
  EVRFingerSplay_VRFingerSplay_Middle_Ring  => 2,
  EVRFingerSplay_VRFingerSplay_Ring_Pinky   => 3,
  EVRFingerSplay_VRFingerSplay_Count        => 4,
);

constant EVRFirmwareError is export := uint32;
our enum EVRFirmwareErrorEnum is export (
  EVRFirmwareError_VRFirmwareError_None    => 0,
  EVRFirmwareError_VRFirmwareError_Success => 1,
  EVRFirmwareError_VRFirmwareError_Fail    => 2,
);

constant EVRInitError is export := uint32;
our enum EVRInitErrorEnum is export (
  EVRInitError_VRInitError_None                                                         =>    0,
  EVRInitError_VRInitError_Unknown                                                      =>    1,
  EVRInitError_VRInitError_Init_InstallationNotFound                                    =>  100,
  EVRInitError_VRInitError_Init_InstallationCorrupt                                     =>  101,
  EVRInitError_VRInitError_Init_VRClientDLLNotFound                                     =>  102,
  EVRInitError_VRInitError_Init_FileNotFound                                            =>  103,
  EVRInitError_VRInitError_Init_FactoryNotFound                                         =>  104,
  EVRInitError_VRInitError_Init_InterfaceNotFound                                       =>  105,
  EVRInitError_VRInitError_Init_InvalidInterface                                        =>  106,
  EVRInitError_VRInitError_Init_UserConfigDirectoryInvalid                              =>  107,
  EVRInitError_VRInitError_Init_HmdNotFound                                             =>  108,
  EVRInitError_VRInitError_Init_NotInitialized                                          =>  109,
  EVRInitError_VRInitError_Init_PathRegistryNotFound                                    =>  110,
  EVRInitError_VRInitError_Init_NoConfigPath                                            =>  111,
  EVRInitError_VRInitError_Init_NoLogPath                                               =>  112,
  EVRInitError_VRInitError_Init_PathRegistryNotWritable                                 =>  113,
  EVRInitError_VRInitError_Init_AppInfoInitFailed                                       =>  114,
  EVRInitError_VRInitError_Init_Retry                                                   =>  115,
  EVRInitError_VRInitError_Init_InitCanceledByUser                                      =>  116,
  EVRInitError_VRInitError_Init_AnotherAppLaunching                                     =>  117,
  EVRInitError_VRInitError_Init_SettingsInitFailed                                      =>  118,
  EVRInitError_VRInitError_Init_ShuttingDown                                            =>  119,
  EVRInitError_VRInitError_Init_TooManyObjects                                          =>  120,
  EVRInitError_VRInitError_Init_NoServerForBackgroundApp                                =>  121,
  EVRInitError_VRInitError_Init_NotSupportedWithCompositor                              =>  122,
  EVRInitError_VRInitError_Init_NotAvailableToUtilityApps                               =>  123,
  EVRInitError_VRInitError_Init_Internal                                                =>  124,
  EVRInitError_VRInitError_Init_HmdDriverIdIsNone                                       =>  125,
  EVRInitError_VRInitError_Init_HmdNotFoundPresenceFailed                               =>  126,
  EVRInitError_VRInitError_Init_VRMonitorNotFound                                       =>  127,
  EVRInitError_VRInitError_Init_VRMonitorStartupFailed                                  =>  128,
  EVRInitError_VRInitError_Init_LowPowerWatchdogNotSupported                            =>  129,
  EVRInitError_VRInitError_Init_InvalidApplicationType                                  =>  130,
  EVRInitError_VRInitError_Init_NotAvailableToWatchdogApps                              =>  131,
  EVRInitError_VRInitError_Init_WatchdogDisabledInSettings                              =>  132,
  EVRInitError_VRInitError_Init_VRDashboardNotFound                                     =>  133,
  EVRInitError_VRInitError_Init_VRDashboardStartupFailed                                =>  134,
  EVRInitError_VRInitError_Init_VRHomeNotFound                                          =>  135,
  EVRInitError_VRInitError_Init_VRHomeStartupFailed                                     =>  136,
  EVRInitError_VRInitError_Init_RebootingBusy                                           =>  137,
  EVRInitError_VRInitError_Init_FirmwareUpdateBusy                                      =>  138,
  EVRInitError_VRInitError_Init_FirmwareRecoveryBusy                                    =>  139,
  EVRInitError_VRInitError_Init_USBServiceBusy                                          =>  140,
  EVRInitError_VRInitError_Init_VRWebHelperStartupFailed                                =>  141,
  EVRInitError_VRInitError_Init_TrackerManagerInitFailed                                =>  142,
  EVRInitError_VRInitError_Init_AlreadyRunning                                          =>  143,
  EVRInitError_VRInitError_Init_FailedForVrMonitor                                      =>  144,
  EVRInitError_VRInitError_Init_PropertyManagerInitFailed                               =>  145,
  EVRInitError_VRInitError_Init_WebServerFailed                                         =>  146,
  EVRInitError_VRInitError_Driver_Failed                                                =>  200,
  EVRInitError_VRInitError_Driver_Unknown                                               =>  201,
  EVRInitError_VRInitError_Driver_HmdUnknown                                            =>  202,
  EVRInitError_VRInitError_Driver_NotLoaded                                             =>  203,
  EVRInitError_VRInitError_Driver_RuntimeOutOfDate                                      =>  204,
  EVRInitError_VRInitError_Driver_HmdInUse                                              =>  205,
  EVRInitError_VRInitError_Driver_NotCalibrated                                         =>  206,
  EVRInitError_VRInitError_Driver_CalibrationInvalid                                    =>  207,
  EVRInitError_VRInitError_Driver_HmdDisplayNotFound                                    =>  208,
  EVRInitError_VRInitError_Driver_TrackedDeviceInterfaceUnknown                         =>  209,
  EVRInitError_VRInitError_Driver_HmdDriverIdOutOfBounds                                =>  211,
  EVRInitError_VRInitError_Driver_HmdDisplayMirrored                                    =>  212,
  EVRInitError_VRInitError_Driver_HmdDisplayNotFoundLaptop                              =>  213,
  EVRInitError_VRInitError_IPC_ServerInitFailed                                         =>  300,
  EVRInitError_VRInitError_IPC_ConnectFailed                                            =>  301,
  EVRInitError_VRInitError_IPC_SharedStateInitFailed                                    =>  302,
  EVRInitError_VRInitError_IPC_CompositorInitFailed                                     =>  303,
  EVRInitError_VRInitError_IPC_MutexInitFailed                                          =>  304,
  EVRInitError_VRInitError_IPC_Failed                                                   =>  305,
  EVRInitError_VRInitError_IPC_CompositorConnectFailed                                  =>  306,
  EVRInitError_VRInitError_IPC_CompositorInvalidConnectResponse                         =>  307,
  EVRInitError_VRInitError_IPC_ConnectFailedAfterMultipleAttempts                       =>  308,
  EVRInitError_VRInitError_IPC_ConnectFailedAfterTargetExited                           =>  309,
  EVRInitError_VRInitError_IPC_NamespaceUnavailable                                     =>  310,
  EVRInitError_VRInitError_Compositor_Failed                                            =>  400,
  EVRInitError_VRInitError_Compositor_D3D11HardwareRequired                             =>  401,
  EVRInitError_VRInitError_Compositor_FirmwareRequiresUpdate                            =>  402,
  EVRInitError_VRInitError_Compositor_OverlayInitFailed                                 =>  403,
  EVRInitError_VRInitError_Compositor_ScreenshotsInitFailed                             =>  404,
  EVRInitError_VRInitError_Compositor_UnableToCreateDevice                              =>  405,
  EVRInitError_VRInitError_Compositor_SharedStateIsNull                                 =>  406,
  EVRInitError_VRInitError_Compositor_NotificationManagerIsNull                         =>  407,
  EVRInitError_VRInitError_Compositor_ResourceManagerClientIsNull                       =>  408,
  EVRInitError_VRInitError_Compositor_MessageOverlaySharedStateInitFailure              =>  409,
  EVRInitError_VRInitError_Compositor_PropertiesInterfaceIsNull                         =>  410,
  EVRInitError_VRInitError_Compositor_CreateFullscreenWindowFailed                      =>  411,
  EVRInitError_VRInitError_Compositor_SettingsInterfaceIsNull                           =>  412,
  EVRInitError_VRInitError_Compositor_FailedToShowWindow                                =>  413,
  EVRInitError_VRInitError_Compositor_DistortInterfaceIsNull                            =>  414,
  EVRInitError_VRInitError_Compositor_DisplayFrequencyFailure                           =>  415,
  EVRInitError_VRInitError_Compositor_RendererInitializationFailed                      =>  416,
  EVRInitError_VRInitError_Compositor_DXGIFactoryInterfaceIsNull                        =>  417,
  EVRInitError_VRInitError_Compositor_DXGIFactoryCreateFailed                           =>  418,
  EVRInitError_VRInitError_Compositor_DXGIFactoryQueryFailed                            =>  419,
  EVRInitError_VRInitError_Compositor_InvalidAdapterDesktop                             =>  420,
  EVRInitError_VRInitError_Compositor_InvalidHmdAttachment                              =>  421,
  EVRInitError_VRInitError_Compositor_InvalidOutputDesktop                              =>  422,
  EVRInitError_VRInitError_Compositor_InvalidDeviceProvided                             =>  423,
  EVRInitError_VRInitError_Compositor_D3D11RendererInitializationFailed                 =>  424,
  EVRInitError_VRInitError_Compositor_FailedToFindDisplayMode                           =>  425,
  EVRInitError_VRInitError_Compositor_FailedToCreateSwapChain                           =>  426,
  EVRInitError_VRInitError_Compositor_FailedToGetBackBuffer                             =>  427,
  EVRInitError_VRInitError_Compositor_FailedToCreateRenderTarget                        =>  428,
  EVRInitError_VRInitError_Compositor_FailedToCreateDXGI2SwapChain                      =>  429,
  EVRInitError_VRInitError_Compositor_FailedtoGetDXGI2BackBuffer                        =>  430,
  EVRInitError_VRInitError_Compositor_FailedToCreateDXGI2RenderTarget                   =>  431,
  EVRInitError_VRInitError_Compositor_FailedToGetDXGIDeviceInterface                    =>  432,
  EVRInitError_VRInitError_Compositor_SelectDisplayMode                                 =>  433,
  EVRInitError_VRInitError_Compositor_FailedToCreateNvAPIRenderTargets                  =>  434,
  EVRInitError_VRInitError_Compositor_NvAPISetDisplayMode                               =>  435,
  EVRInitError_VRInitError_Compositor_FailedToCreateDirectModeDisplay                   =>  436,
  EVRInitError_VRInitError_Compositor_InvalidHmdPropertyContainer                       =>  437,
  EVRInitError_VRInitError_Compositor_UpdateDisplayFrequency                            =>  438,
  EVRInitError_VRInitError_Compositor_CreateRasterizerState                             =>  439,
  EVRInitError_VRInitError_Compositor_CreateWireframeRasterizerState                    =>  440,
  EVRInitError_VRInitError_Compositor_CreateSamplerState                                =>  441,
  EVRInitError_VRInitError_Compositor_CreateClampToBorderSamplerState                   =>  442,
  EVRInitError_VRInitError_Compositor_CreateAnisoSamplerState                           =>  443,
  EVRInitError_VRInitError_Compositor_CreateOverlaySamplerState                         =>  444,
  EVRInitError_VRInitError_Compositor_CreatePanoramaSamplerState                        =>  445,
  EVRInitError_VRInitError_Compositor_CreateFontSamplerState                            =>  446,
  EVRInitError_VRInitError_Compositor_CreateNoBlendState                                =>  447,
  EVRInitError_VRInitError_Compositor_CreateBlendState                                  =>  448,
  EVRInitError_VRInitError_Compositor_CreateAlphaBlendState                             =>  449,
  EVRInitError_VRInitError_Compositor_CreateBlendStateMaskR                             =>  450,
  EVRInitError_VRInitError_Compositor_CreateBlendStateMaskG                             =>  451,
  EVRInitError_VRInitError_Compositor_CreateBlendStateMaskB                             =>  452,
  EVRInitError_VRInitError_Compositor_CreateDepthStencilState                           =>  453,
  EVRInitError_VRInitError_Compositor_CreateDepthStencilStateNoWrite                    =>  454,
  EVRInitError_VRInitError_Compositor_CreateDepthStencilStateNoDepth                    =>  455,
  EVRInitError_VRInitError_Compositor_CreateFlushTexture                                =>  456,
  EVRInitError_VRInitError_Compositor_CreateDistortionSurfaces                          =>  457,
  EVRInitError_VRInitError_Compositor_CreateConstantBuffer                              =>  458,
  EVRInitError_VRInitError_Compositor_CreateHmdPoseConstantBuffer                       =>  459,
  EVRInitError_VRInitError_Compositor_CreateHmdPoseStagingConstantBuffer                =>  460,
  EVRInitError_VRInitError_Compositor_CreateSharedFrameInfoConstantBuffer               =>  461,
  EVRInitError_VRInitError_Compositor_CreateOverlayConstantBuffer                       =>  462,
  EVRInitError_VRInitError_Compositor_CreateSceneTextureIndexConstantBuffer             =>  463,
  EVRInitError_VRInitError_Compositor_CreateReadableSceneTextureIndexConstantBuffer     =>  464,
  EVRInitError_VRInitError_Compositor_CreateLayerGraphicsTextureIndexConstantBuffer     =>  465,
  EVRInitError_VRInitError_Compositor_CreateLayerComputeTextureIndexConstantBuffer      =>  466,
  EVRInitError_VRInitError_Compositor_CreateLayerComputeSceneTextureIndexConstantBuffer =>  467,
  EVRInitError_VRInitError_Compositor_CreateComputeHmdPoseConstantBuffer                =>  468,
  EVRInitError_VRInitError_Compositor_CreateGeomConstantBuffer                          =>  469,
  EVRInitError_VRInitError_Compositor_CreatePanelMaskConstantBuffer                     =>  470,
  EVRInitError_VRInitError_Compositor_CreatePixelSimUBO                                 =>  471,
  EVRInitError_VRInitError_Compositor_CreateMSAARenderTextures                          =>  472,
  EVRInitError_VRInitError_Compositor_CreateResolveRenderTextures                       =>  473,
  EVRInitError_VRInitError_Compositor_CreateComputeResolveRenderTextures                =>  474,
  EVRInitError_VRInitError_Compositor_CreateDriverDirectModeResolveTextures             =>  475,
  EVRInitError_VRInitError_Compositor_OpenDriverDirectModeResolveTextures               =>  476,
  EVRInitError_VRInitError_Compositor_CreateFallbackSyncTexture                         =>  477,
  EVRInitError_VRInitError_Compositor_ShareFallbackSyncTexture                          =>  478,
  EVRInitError_VRInitError_Compositor_CreateOverlayIndexBuffer                          =>  479,
  EVRInitError_VRInitError_Compositor_CreateOverlayVertextBuffer                        =>  480,
  EVRInitError_VRInitError_Compositor_CreateTextVertexBuffer                            =>  481,
  EVRInitError_VRInitError_Compositor_CreateTextIndexBuffer                             =>  482,
  EVRInitError_VRInitError_Compositor_CreateMirrorTextures                              =>  483,
  EVRInitError_VRInitError_Compositor_CreateLastFrameRenderTexture                      =>  484,
  EVRInitError_VRInitError_Compositor_CreateMirrorOverlay                               =>  485,
  EVRInitError_VRInitError_Compositor_FailedToCreateVirtualDisplayBackbuffer            =>  486,
  EVRInitError_VRInitError_Compositor_DisplayModeNotSupported                           =>  487,
  EVRInitError_VRInitError_VendorSpecific_UnableToConnectToOculusRuntime                => 1000,
  EVRInitError_VRInitError_VendorSpecific_WindowsNotInDevMode                           => 1001,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_CantOpenDevice                       => 1101,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_UnableToRequestConfigStart           => 1102,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_NoStoredConfig                       => 1103,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_ConfigTooBig                         => 1104,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_ConfigTooSmall                       => 1105,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_UnableToInitZLib                     => 1106,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_CantReadFirmwareVersion              => 1107,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_UnableToSendUserDataStart            => 1108,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_UnableToGetUserDataStart             => 1109,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_UnableToGetUserDataNext              => 1110,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_UserDataAddressRange                 => 1111,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_UserDataError                        => 1112,
  EVRInitError_VRInitError_VendorSpecific_HmdFound_ConfigFailedSanityCheck              => 1113,
  EVRInitError_VRInitError_VendorSpecific_OculusRuntimeBadInstall                       => 1114,
  EVRInitError_VRInitError_Steam_SteamInstallationNotFound                              => 2000,
  EVRInitError_VRInitError_LastError                                                    => 2001,
);

constant EVRInputError is export := uint32;
our enum EVRInputErrorEnum is export (
  EVRInputError_VRInputError_None                     =>  0,
  EVRInputError_VRInputError_NameNotFound             =>  1,
  EVRInputError_VRInputError_WrongType                =>  2,
  EVRInputError_VRInputError_InvalidHandle            =>  3,
  EVRInputError_VRInputError_InvalidParam             =>  4,
  EVRInputError_VRInputError_NoSteam                  =>  5,
  EVRInputError_VRInputError_MaxCapacityReached       =>  6,
  EVRInputError_VRInputError_IPCError                 =>  7,
  EVRInputError_VRInputError_NoActiveActionSet        =>  8,
  EVRInputError_VRInputError_InvalidDevice            =>  9,
  EVRInputError_VRInputError_InvalidSkeleton          => 10,
  EVRInputError_VRInputError_InvalidBoneCount         => 11,
  EVRInputError_VRInputError_InvalidCompressedData    => 12,
  EVRInputError_VRInputError_NoData                   => 13,
  EVRInputError_VRInputError_BufferTooSmall           => 14,
  EVRInputError_VRInputError_MismatchedActionManifest => 15,
  EVRInputError_VRInputError_MissingSkeletonData      => 16,
  EVRInputError_VRInputError_InvalidBoneIndex         => 17,
);

constant EVRInputFilterCancelType is export := uint32;
our enum EVRInputFilterCancelTypeEnum is export (
  EVRInputFilterCancelType_VRInputFilterCancel_Timers   => 0,
  EVRInputFilterCancelType_VRInputFilterCancel_Momentum => 1,
);

constant EVRInputStringBits is export := int32;
our enum EVRInputStringBitsEnum is export (
  EVRInputStringBits_VRInputString_Hand           =>  1,
  EVRInputStringBits_VRInputString_ControllerType =>  2,
  EVRInputStringBits_VRInputString_InputSource    =>  4,
  EVRInputStringBits_VRInputString_All            => -1,
);

constant EVRMouseButton is export := uint32;
our enum EVRMouseButtonEnum is export (
  EVRMouseButton_VRMouseButton_Left   => 1,
  EVRMouseButton_VRMouseButton_Right  => 2,
  EVRMouseButton_VRMouseButton_Middle => 4,
);

constant EVRMuraCorrectionMode is export := uint32;
our enum EVRMuraCorrectionModeEnum is export (
  EVRMuraCorrectionMode_Default      => 0,
  EVRMuraCorrectionMode_NoCorrection => 1,
);

constant EVRNotificationError is export := uint32;
our enum EVRNotificationErrorEnum is export (
  EVRNotificationError_VRNotificationError_OK                               =>   0,
  EVRNotificationError_VRNotificationError_InvalidNotificationId            => 100,
  EVRNotificationError_VRNotificationError_NotificationQueueFull            => 101,
  EVRNotificationError_VRNotificationError_InvalidOverlayHandle             => 102,
  EVRNotificationError_VRNotificationError_SystemWithUserValueAlreadyExists => 103,
);

constant EVRNotificationStyle is export := uint32;
our enum EVRNotificationStyleEnum is export (
  EVRNotificationStyle_None             =>   0,
  EVRNotificationStyle_Application      => 100,
  EVRNotificationStyle_Contact_Disabled => 200,
  EVRNotificationStyle_Contact_Enabled  => 201,
  EVRNotificationStyle_Contact_Active   => 202,
);

constant EVRNotificationType is export := uint32;
our enum EVRNotificationTypeEnum is export (
  EVRNotificationType_Transient                     => 0,
  EVRNotificationType_Persistent                    => 1,
  EVRNotificationType_Transient_SystemWithUserValue => 2,
);

constant EVROverlayError is export := uint32;
our enum EVROverlayErrorEnum is export (
  EVROverlayError_VROverlayError_None                       =>  0,
  EVROverlayError_VROverlayError_UnknownOverlay             => 10,
  EVROverlayError_VROverlayError_InvalidHandle              => 11,
  EVROverlayError_VROverlayError_PermissionDenied           => 12,
  EVROverlayError_VROverlayError_OverlayLimitExceeded       => 13,
  EVROverlayError_VROverlayError_WrongVisibilityType        => 14,
  EVROverlayError_VROverlayError_KeyTooLong                 => 15,
  EVROverlayError_VROverlayError_NameTooLong                => 16,
  EVROverlayError_VROverlayError_KeyInUse                   => 17,
  EVROverlayError_VROverlayError_WrongTransformType         => 18,
  EVROverlayError_VROverlayError_InvalidTrackedDevice       => 19,
  EVROverlayError_VROverlayError_InvalidParameter           => 20,
  EVROverlayError_VROverlayError_ThumbnailCantBeDestroyed   => 21,
  EVROverlayError_VROverlayError_ArrayTooSmall              => 22,
  EVROverlayError_VROverlayError_RequestFailed              => 23,
  EVROverlayError_VROverlayError_InvalidTexture             => 24,
  EVROverlayError_VROverlayError_UnableToLoadFile           => 25,
  EVROverlayError_VROverlayError_KeyboardAlreadyInUse       => 26,
  EVROverlayError_VROverlayError_NoNeighbor                 => 27,
  EVROverlayError_VROverlayError_TooManyMaskPrimitives      => 29,
  EVROverlayError_VROverlayError_BadMaskPrimitive           => 30,
  EVROverlayError_VROverlayError_TextureAlreadyLocked       => 31,
  EVROverlayError_VROverlayError_TextureLockCapacityReached => 32,
  EVROverlayError_VROverlayError_TextureNotLocked           => 33,
);

constant EVROverlayIntersectionMaskPrimitiveType is export := uint32;
our enum EVROverlayIntersectionMaskPrimitiveTypeEnum is export (
  EVROverlayIntersectionMaskPrimitiveType_OverlayIntersectionPrimitiveType_Rectangle => 0,
  EVROverlayIntersectionMaskPrimitiveType_OverlayIntersectionPrimitiveType_Circle    => 1,
);

constant EVRRenderModelError is export := uint32;
our enum EVRRenderModelErrorEnum is export (
  EVRRenderModelError_VRRenderModelError_None               =>   0,
  EVRRenderModelError_VRRenderModelError_Loading            => 100,
  EVRRenderModelError_VRRenderModelError_NotSupported       => 200,
  EVRRenderModelError_VRRenderModelError_InvalidArg         => 300,
  EVRRenderModelError_VRRenderModelError_InvalidModel       => 301,
  EVRRenderModelError_VRRenderModelError_NoShapes           => 302,
  EVRRenderModelError_VRRenderModelError_MultipleShapes     => 303,
  EVRRenderModelError_VRRenderModelError_TooManyVertices    => 304,
  EVRRenderModelError_VRRenderModelError_MultipleTextures   => 305,
  EVRRenderModelError_VRRenderModelError_BufferTooSmall     => 306,
  EVRRenderModelError_VRRenderModelError_NotEnoughNormals   => 307,
  EVRRenderModelError_VRRenderModelError_NotEnoughTexCoords => 308,
  EVRRenderModelError_VRRenderModelError_InvalidTexture     => 400,
);

constant EVRSceneApplicationState is export := uint32;
our enum EVRSceneApplicationStateEnum is export (
  EVRSceneApplicationState_None     => 0,
  EVRSceneApplicationState_Starting => 1,
  EVRSceneApplicationState_Quitting => 2,
  EVRSceneApplicationState_Running  => 3,
  EVRSceneApplicationState_Waiting  => 4,
);

constant EVRScreenshotError is export := uint32;
our enum EVRScreenshotErrorEnum is export (
  EVRScreenshotError_VRScreenshotError_None                        =>   0,
  EVRScreenshotError_VRScreenshotError_RequestFailed               =>   1,
  EVRScreenshotError_VRScreenshotError_IncompatibleVersion         => 100,
  EVRScreenshotError_VRScreenshotError_NotFound                    => 101,
  EVRScreenshotError_VRScreenshotError_BufferTooSmall              => 102,
  EVRScreenshotError_VRScreenshotError_ScreenshotAlreadyInProgress => 108,
);

constant EVRScreenshotPropertyFilenames is export := uint32;
our enum EVRScreenshotPropertyFilenamesEnum is export (
  EVRScreenshotPropertyFilenames_VRScreenshotPropertyFilenames_Preview => 0,
  EVRScreenshotPropertyFilenames_VRScreenshotPropertyFilenames_VR      => 1,
);

constant EVRScreenshotType is export := uint32;
our enum EVRScreenshotTypeEnum is export (
  EVRScreenshotType_VRScreenshotType_None           => 0,
  EVRScreenshotType_VRScreenshotType_Mono           => 1,
  EVRScreenshotType_VRScreenshotType_Stereo         => 2,
  EVRScreenshotType_VRScreenshotType_Cubemap        => 3,
  EVRScreenshotType_VRScreenshotType_MonoPanorama   => 4,
  EVRScreenshotType_VRScreenshotType_StereoPanorama => 5,
);

constant EVRSettingsError is export := uint32;
our enum EVRSettingsErrorEnum is export (
  EVRSettingsError_VRSettingsError_None                     => 0,
  EVRSettingsError_VRSettingsError_IPCFailed                => 1,
  EVRSettingsError_VRSettingsError_WriteFailed              => 2,
  EVRSettingsError_VRSettingsError_ReadFailed               => 3,
  EVRSettingsError_VRSettingsError_JsonParseFailed          => 4,
  EVRSettingsError_VRSettingsError_UnsetSettingHasNoDefault => 5,
);

constant EVRSkeletalMotionRange is export := uint32;
our enum EVRSkeletalMotionRangeEnum is export (
  EVRSkeletalMotionRange_VRSkeletalMotionRange_WithController    => 0,
  EVRSkeletalMotionRange_VRSkeletalMotionRange_WithoutController => 1,
);

constant EVRSkeletalReferencePose is export := uint32;
our enum EVRSkeletalReferencePoseEnum is export (
  EVRSkeletalReferencePose_VRSkeletalReferencePose_BindPose  => 0,
  EVRSkeletalReferencePose_VRSkeletalReferencePose_OpenHand  => 1,
  EVRSkeletalReferencePose_VRSkeletalReferencePose_Fist      => 2,
  EVRSkeletalReferencePose_VRSkeletalReferencePose_GripLimit => 3,
);

constant EVRSkeletalTrackingLevel is export := uint32;
our enum EVRSkeletalTrackingLevelEnum is export (
  EVRSkeletalTrackingLevel_VRSkeletalTracking_Estimated  => 0,
  EVRSkeletalTrackingLevel_VRSkeletalTracking_Partial    => 1,
  EVRSkeletalTrackingLevel_VRSkeletalTracking_Full       => 2,
  EVRSkeletalTrackingLevel_VRSkeletalTrackingLevel_Count => 3,
  EVRSkeletalTrackingLevel_VRSkeletalTrackingLevel_Max   => 2,
);

constant EVRSkeletalTransformSpace is export := uint32;
our enum EVRSkeletalTransformSpaceEnum is export (
  EVRSkeletalTransformSpace_VRSkeletalTransformSpace_Model  => 0,
  EVRSkeletalTransformSpace_VRSkeletalTransformSpace_Parent => 1,
);

constant EVRSpatialAnchorError is export := uint32;
our enum EVRSpatialAnchorErrorEnum is export (
  EVRSpatialAnchorError_VRSpatialAnchorError_Success                    =>  0,
  EVRSpatialAnchorError_VRSpatialAnchorError_Internal                   =>  1,
  EVRSpatialAnchorError_VRSpatialAnchorError_UnknownHandle              =>  2,
  EVRSpatialAnchorError_VRSpatialAnchorError_ArrayTooSmall              =>  3,
  EVRSpatialAnchorError_VRSpatialAnchorError_InvalidDescriptorChar      =>  4,
  EVRSpatialAnchorError_VRSpatialAnchorError_NotYetAvailable            =>  5,
  EVRSpatialAnchorError_VRSpatialAnchorError_NotAvailableInThisUniverse =>  6,
  EVRSpatialAnchorError_VRSpatialAnchorError_PermanentlyUnavailable     =>  7,
  EVRSpatialAnchorError_VRSpatialAnchorError_WrongDriver                =>  8,
  EVRSpatialAnchorError_VRSpatialAnchorError_DescriptorTooLong          =>  9,
  EVRSpatialAnchorError_VRSpatialAnchorError_Unknown                    => 10,
  EVRSpatialAnchorError_VRSpatialAnchorError_NoRoomCalibration          => 11,
  EVRSpatialAnchorError_VRSpatialAnchorError_InvalidArgument            => 12,
  EVRSpatialAnchorError_VRSpatialAnchorError_UnknownDriver              => 13,
);

constant EVRState is export := int32;
our enum EVRStateEnum is export (
  EVRState_VRState_Undefined       => -1,
  EVRState_VRState_Off             =>  0,
  EVRState_VRState_Searching       =>  1,
  EVRState_VRState_Searching_Alert =>  2,
  EVRState_VRState_Ready           =>  3,
  EVRState_VRState_Ready_Alert     =>  4,
  EVRState_VRState_NotReady        =>  5,
  EVRState_VRState_Standby         =>  6,
  EVRState_VRState_Ready_Alert_Low =>  7,
);

constant EVRSubmitFlags is export := uint32;
our enum EVRSubmitFlagsEnum is export (
  EVRSubmitFlags_Submit_Default                      =>  0,
  EVRSubmitFlags_Submit_LensDistortionAlreadyApplied =>  1,
  EVRSubmitFlags_Submit_GlRenderBuffer               =>  2,
  EVRSubmitFlags_Submit_Reserved                     =>  4,
  EVRSubmitFlags_Submit_TextureWithPose              =>  8,
  EVRSubmitFlags_Submit_TextureWithDepth             => 16,
);

constant EVRSummaryType is export := uint32;
our enum EVRSummaryTypeEnum is export (
  EVRSummaryType_VRSummaryType_FromAnimation => 0,
  EVRSummaryType_VRSummaryType_FromDevice    => 1,
);

constant EVRTrackedCameraError is export := uint32;
our enum EVRTrackedCameraErrorEnum is export (
  EVRTrackedCameraError_VRTrackedCameraError_None                       =>   0,
  EVRTrackedCameraError_VRTrackedCameraError_OperationFailed            => 100,
  EVRTrackedCameraError_VRTrackedCameraError_InvalidHandle              => 101,
  EVRTrackedCameraError_VRTrackedCameraError_InvalidFrameHeaderVersion  => 102,
  EVRTrackedCameraError_VRTrackedCameraError_OutOfHandles               => 103,
  EVRTrackedCameraError_VRTrackedCameraError_IPCFailure                 => 104,
  EVRTrackedCameraError_VRTrackedCameraError_NotSupportedForThisDevice  => 105,
  EVRTrackedCameraError_VRTrackedCameraError_SharedMemoryFailure        => 106,
  EVRTrackedCameraError_VRTrackedCameraError_FrameBufferingFailure      => 107,
  EVRTrackedCameraError_VRTrackedCameraError_StreamSetupFailure         => 108,
  EVRTrackedCameraError_VRTrackedCameraError_InvalidGLTextureId         => 109,
  EVRTrackedCameraError_VRTrackedCameraError_InvalidSharedTextureHandle => 110,
  EVRTrackedCameraError_VRTrackedCameraError_FailedToGetGLTextureId     => 111,
  EVRTrackedCameraError_VRTrackedCameraError_SharedTextureFailure       => 112,
  EVRTrackedCameraError_VRTrackedCameraError_NoFrameAvailable           => 113,
  EVRTrackedCameraError_VRTrackedCameraError_InvalidArgument            => 114,
  EVRTrackedCameraError_VRTrackedCameraError_InvalidFrameBufferSize     => 115,
);

constant EVRTrackedCameraFrameLayout is export := uint32;
our enum EVRTrackedCameraFrameLayoutEnum is export (
  EVRTrackedCameraFrameLayout_Mono             =>  1,
  EVRTrackedCameraFrameLayout_Stereo           =>  2,
  EVRTrackedCameraFrameLayout_VerticalLayout   => 16,
  EVRTrackedCameraFrameLayout_HorizontalLayout => 32,
);

constant EVRTrackedCameraFrameType is export := uint32;
our enum EVRTrackedCameraFrameTypeEnum is export (
  EVRTrackedCameraFrameType_VRTrackedCameraFrameType_Distorted          => 0,
  EVRTrackedCameraFrameType_VRTrackedCameraFrameType_Undistorted        => 1,
  EVRTrackedCameraFrameType_VRTrackedCameraFrameType_MaximumUndistorted => 2,
  EVRTrackedCameraFrameType_MAX_CAMERA_FRAME_TYPES                      => 3,
);

constant EVSync is export := uint32;
our enum EVSyncEnum is export (
  EVSync_VSync_None         => 0,
  EVSync_VSync_WaitRender   => 1,
  EVSync_VSync_NoWaitRender => 2,
);

constant Imu_OffScaleFlags is export := uint32;
our enum Imu_OffScaleFlagsEnum is export (
  Imu_OffScaleFlags_OffScale_AccelX =>  1,
  Imu_OffScaleFlags_OffScale_AccelY =>  2,
  Imu_OffScaleFlags_OffScale_AccelZ =>  4,
  Imu_OffScaleFlags_OffScale_GyroX  =>  8,
  Imu_OffScaleFlags_OffScale_GyroY  => 16,
  Imu_OffScaleFlags_OffScale_GyroZ  => 32,
);

constant VRMessageOverlayResponse is export := uint32;
our enum VRMessageOverlayResponseEnum is export (
  VRMessageOverlayResponse_ButtonPress_0                    => 0,
  VRMessageOverlayResponse_ButtonPress_1                    => 1,
  VRMessageOverlayResponse_ButtonPress_2                    => 2,
  VRMessageOverlayResponse_ButtonPress_3                    => 3,
  VRMessageOverlayResponse_CouldntFindSystemOverlay         => 4,
  VRMessageOverlayResponse_CouldntFindOrCreateClientOverlay => 5,
  VRMessageOverlayResponse_ApplicationQuit                  => 6,
);

constant VROverlayFlags is export := uint32;
our enum VROverlayFlagsEnum is export (
  VROverlayFlags_NoDashboardTab                     =>      8,
  VROverlayFlags_SendVRDiscreteScrollEvents         =>     64,
  VROverlayFlags_SendVRTouchpadEvents               =>    128,
  VROverlayFlags_ShowTouchPadScrollWheel            =>    256,
  VROverlayFlags_TransferOwnershipToInternalProcess =>    512,
  VROverlayFlags_SideBySide_Parallel                =>   1024,
  VROverlayFlags_SideBySide_Crossed                 =>   2048,
  VROverlayFlags_Panorama                           =>   4096,
  VROverlayFlags_StereoPanorama                     =>   8192,
  VROverlayFlags_SortWithNonSceneOverlays           =>  16384,
  VROverlayFlags_VisibleInDashboard                 =>  32768,
  VROverlayFlags_MakeOverlaysInteractiveIfVisible   =>  65536,
  VROverlayFlags_SendVRSmoothScrollEvents           => 131072,
  VROverlayFlags_ProtectedContent                   => 262144,
  VROverlayFlags_HideLaserIntersection              => 524288,
);

constant VROverlayInputMethod is export := uint32;
our enum VROverlayInputMethodEnum is export (
  VROverlayInputMethod_None       => 0,
  VROverlayInputMethod_Mouse      => 1,
  VROverlayInputMethod_DualAnalog => 2,
);

constant VROverlayTransformType is export := uint32;
our enum VROverlayTransformTypeEnum is export (
  VROverlayTransformType_VROverlayTransform_Absolute              => 0,
  VROverlayTransformType_VROverlayTransform_TrackedDeviceRelative => 1,
  VROverlayTransformType_VROverlayTransform_SystemOverlay         => 2,
  VROverlayTransformType_VROverlayTransform_TrackedComponent      => 3,
);

# PropertyTypeTag_t
our enum PropertyTypeTagEnum is export (
  k_unInvalidPropertyTag           =>     0,
  k_unFloatPropertyTag             =>     1,
  k_unInt32PropertyTag             =>     2,
  k_unUint64PropertyTag            =>     3,
  k_unBoolPropertyTag              =>     4,
  k_unStringPropertyTag            =>     5,

  k_unHmdMatrix34PropertyTag       =>    20,
  k_unHmdMatrix44PropertyTag       =>    21,
  k_unHmdVector3PropertyTag        =>    22,
  k_unHmdVector4PropertyTag        =>    23,
  k_unHmdVector2PropertyTag        =>    24,
  k_unHmdQuadPropertyTag           =>    25,

  k_unHiddenAreaPropertyTag        =>    30,
  k_unPathHandleInfoTag            =>    31,
  k_unActionPropertyTag            =>    32,
  k_unInputValuePropertyTag        =>    33,
  k_unWildcardPropertyTag          =>    34,
  k_unHapticVibrationPropertyTag   =>    35,
  k_unSkeletonPropertyTag          =>    36,

  k_unSpatialAnchorPosePropertyTag =>    40,
  k_unJsonPropertyTag              =>    41,
  k_unActiveActionSetPropertyTag   =>    42,

  k_unOpenVRInternalReserved_Start =>  1000,
  k_unOpenVRInternalReserved_End   => 10000
);

# No type association
our enum SteamVRVersionEnum is export (
  k_nSteamVRVersionMajor => 1,
  k_nSteamVRVersionMinor => 8,
  k_nSteamVRVersionBuild => 19
);

BEGIN {
  for EXPORT::DEFAULT::.pairs.grep({
    .key.defined && .key.ends-with('Enum')
  }).sort( *.key ) -> \enum  {
    my %e-pairs = enum.value.enums.pairs.Hash;
    my @e-keys = %e-pairs.keys;
    my $prefix = getLongestSubstr( |@e-keys );

    say "Enum { enum.key }: $prefix" if %*ENV<OPENVR_DEBUG>;

    my $prefix-count = count-substring($prefix, '_');
    if $prefix-count >= 1 {
      # Trim up to 3 tokens max!
      my $to = min($prefix-count, 3);
      for ^$to  {
        # cw: keep all defs from loop until entire loop is processed.
        #     if ANY collisions, drop whole set of defs!
        my $collided = False;
        my %NEW-KEYS;
        for @e-keys -> \enum-key {
          my $loop-prefix = $prefix.split(/_/)[^$_].join('_') ~ '_';
          my $nvn = enum-key.subst($loop-prefix, '');
          #say "EK: { enum-key }";
          my $nvv := ::EXPORT::DEFAULT::{enum-key};
          #say "NVV: { $nvv }";

          # Collision detection
          if [&&](
                        EXPORT::DEFAULT::{$nvn}:exists.not,
            %OPENVR-RAW-ENUMS-NEW-EXPORTS{$nvn}:exists.not
          ) {
            # cw: YYY - Bind to enum constant in EXPORT table, instead
            %NEW-KEYS{$nvn} := $nvv;
          } else {
            $collided = True;
          }
        }
        if $collided.not {
          %OPENVR-RAW-ENUMS-NEW-EXPORTS{.key} := .value for %NEW-KEYS.pairs
        } else {
          my $nk = %NEW-KEYS.keys.join(', ');
          warn  "A key in ({$nk}) already exists in EXPORT table. Skipping..."
            if %*ENV<OPENVR_DEBUG>;
        }
      }
    }
  }
}
