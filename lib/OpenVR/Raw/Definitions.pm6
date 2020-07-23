use v6;

use NativeCall;

use OpenVR::Raw::Enums;

unit package OpenVR::Raw::Definitions;

constant PropertyContainerHandle_t is export := uint64;
constant PropertyTypeTag_t         is export := uint32;
constant VRActionHandle_t          is export := uint64;
constant VRActionSetHandle_t       is export := uint64;
constant VRInputValueHandle_t      is export := uint64;
constant TrackedDeviceIndex_t      is export := uint32;
constant VRNotificationId          is export := uint32;
constant VROverlayHandle_t         is export := uint64;
constant SpatialAnchorHandle_t     is export := uint32;
constant glSharedTextureaHandle_t  is export := Pointer;
constant glInt_t                   is export := int32;
constant glUInt_t                  is export := uint32;
constant SharedTextureHandle_t     is export := uint64;
constant DriverId_t                is export := uint32;
constant WebConsoleHandle_t        is export := uint64;
constant DriverHandle_t            is export := PropertyContainerHandle_t;
constant BoneIndex_t               is export := int32;
constant TrackedCameraHandle_t     is export := uint64;
constant ScreenshotHandle_t        is export := uint32;
constant VRComponentProperties     is export := uint32;
constant TextureID_t               is export := int32;
constant IOBufferHandle_t          is export := uint64;
constant VrProfilerEventHandle_t   is export := uint64;
constant HmdError                  is export := EVRInitError;
constant Hmd_Eye                   is export := EVREye;
constant ColorSpace                is export := EColorSpace;
constant HmdTrackingResult         is export := ETrackingResult;
constant TrackedDeviceClass        is export := ETrackedDeviceClass;
constant TrackingUniverseOrigin    is export := ETrackingUniverseOrigin;
constant TrackedDeviceProperty     is export := ETrackedDeviceProperty;
constant TrackedPropertyError      is export := ETrackedPropertyError;
constant VRSubmitFlags_t           is export := EVRSubmitFlags;
constant VRState_t                 is export := EVRState;
constant CollisionBoundsStyle_t    is export := ECollisionBoundsStyle;
constant VROverlayError            is export := EVROverlayError;
constant VRFirmwareError           is export := EVRFirmwareError;
constant VRCompositorError         is export := EVRCompositorError;
constant VRScreenshotsError        is export := EVRScreenshotError;

constant VkDevice_T                is export := Pointer;
constant VkPhysicalDevice_T        is export := Pointer;
constant VkInstance_T              is export := Pointer;
constant VkQueue_T                 is export := Pointer;

constant ID3D12Resource            is export := Pointer;
constant ID3D12CommandQueue        is export := Pointer;
