use v6;

use NativeCall;

use OpenVR::Raw::Enums;

unit package OpenVR::Raw::Definitions;

constant BoneIndex_t               is export := int32;
constant CollisionBoundsStyle_t    is export := ECollisionBoundsStyle;
constant ColorSpace                is export := EColorSpace;
constant DriverId_t                is export := uint32;
constant glInt_t                   is export := int32;
constant glSharedTextureaHandle_t  is export := Pointer;
constant glSharedTextureHandle_t   is export := Pointer;
constant glUInt_t                  is export := uint32;
constant Hmd_Eye                   is export := EVREye;
constant HmdError                  is export := EVRInitError;
constant HmdTrackingResult         is export := ETrackingResult;
constant IOBufferHandle_t          is export := uint64;
constant PropertyContainerHandle_t is export := uint64;
constant PropertyTypeTag_t         is export := uint32;
constant ScreenshotHandle_t        is export := uint32;
constant SharedTextureHandle_t     is export := uint64;
constant SpatialAnchorHandle_t     is export := uint32;
constant TextureID_t               is export := int32;
constant TrackedCameraHandle_t     is export := uint64;
constant TrackedDeviceClass        is export := ETrackedDeviceClass;
constant TrackedDeviceIndex_t      is export := uint32;
constant TrackedDeviceProperty     is export := ETrackedDeviceProperty;
constant TrackedPropertyError      is export := ETrackedPropertyError;
constant TrackingUniverseOrigin    is export := ETrackingUniverseOrigin;
constant VRActionHandle_t          is export := uint64;
constant VRActionSetHandle_t       is export := uint64;
constant VRComponentProperties     is export := uint32;
constant VRCompositorError         is export := EVRCompositorError;
constant VRFirmwareError           is export := EVRFirmwareError;
constant VRInputValueHandle_t      is export := uint64;
constant VRNotificationId          is export := uint32;
constant VROverlayError            is export := EVROverlayError;
constant VROverlayHandle_t         is export := uint64;
constant VrProfilerEventHandle_t   is export := uint64;
constant VRScreenshotsError        is export := EVRScreenshotError;
constant VRState_t                 is export := EVRState;
constant VRSubmitFlags_t           is export := EVRSubmitFlags;
constant WebConsoleHandle_t        is export := uint64;

constant DriverHandle_t            is export := PropertyContainerHandle_t;

constant VkDevice_T                is export := Pointer;
constant VkPhysicalDevice_T        is export := Pointer;
constant VkInstance_T              is export := Pointer;
constant VkQueue_T                 is export := Pointer;

constant ID3D12Resource            is export := Pointer;
constant ID3D12CommandQueue        is export := Pointer;
