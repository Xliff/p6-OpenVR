use v6;

use NativeCall;

use OpenVR::Raw::Enums;
use OpenVR::Raw::Definitions;

unit package OpenVR::Raw::Structs;

class X::OpenVR::Matrix::RangeError is Exception {
  method message { 'RC Index out of range!' }
}
class X::OpenVR::Array::RangeError is Exception {
  method message { 'Index out of range!' }
}

class X::OpenVR::ExcessiveStringLength is Exception {
  method message { 'String too long!' }
}

role Matrix [$R, $C] {
  method elem (Int() $r, Int() $c) is rw {
    X::OpenVR::Matrix::RangeError.new.throw unless $r < $R && $c < $C;

    @.m[$r * $C + $c]
  }
}

role OpenVRInterface is export { }

my %LIMITS;
role Indexable {
  method limits (Str $attr) {
    %LIMITS{::?CLASS.^name}{$attr};
  }
}

role Indexable [$I] {
  method elem (Int() $i) is rw {
    X::OpenVR::Matrix::RangeError.new.throw unless $i < $I;
    @.m[$i];
  }
}

class HmdMatrix34_t is repr<CStruct> is export does Matrix[3, 4] {
        HAS num32 @.m[12] is CArray; # num32[3][4]
}

class HmdMatrix33_t is repr<CStruct> is export does Matrix[3, 3] {
        HAS num32 @.m[9] is CArray; # num32[3][3]
}

class HmdMatrix44_t is repr<CStruct> is export does Matrix[4, 4] {
        HAS num32 @.m[16] is CArray; # num32[4][4]
}

class HmdVector3_t is repr<CStruct> is export does Indexable[3] {
        HAS num32 @.v[3] is CArray;
}

class HmdVector4_t is repr<CStruct> is export does Indexable[4] {
        HAS num32 @.v[4] is CArray;
}

class HmdVector3d_t is repr<CStruct> is export does Indexable[3] {
        HAS num64 @.v[3] is CArray;
}

class HmdVector2_t is repr<CStruct> is export does Indexable[2] {
        HAS num32 @.v[2] is CArray;
}

class HmdQuaternion_t is repr<CStruct> is export {
        has num64 $.w is rw;
        has num64 $.x is rw;
        has num64 $.y is rw;
        has num64 $.z is rw;
}

class HmdQuaternionf_t is repr<CStruct> is export {
        has num32 $.w is rw;
        has num32 $.x is rw;
        has num32 $.y is rw;
        has num32 $.z is rw;
}

class HmdColor_t is repr<CStruct> is export {
        has num32 $.r is rw;
        has num32 $.g is rw;
        has num32 $.b is rw;
        has num32 $.a is rw;
}

class HmdQuad_t is repr<CStruct> is export does Indexable {
        has Pointer $!vCorners; #= struct vr::HmdVector3_t[4]
}

class HmdRect2_t is repr<CStruct> is export {
        HAS HmdVector2_t $.vTopLeft;
        HAS HmdVector2_t $.vBottomRight;
}

class DistortionCoordinates_t is repr<CStruct> is export does Indexable {
        HAS num32 @!rfRed[2]   is CArray; #= num32[2]
        HAS num32 @!rfGreen[2] is CArray; #= num32[2]
        HAS num32 @!rfBlue[2]  is CArray; #= num32[2]
}

class Texture_t is repr<CStruct> is export {
        has Pointer      $.handle      is rw; #=  Pointer *
        has ETextureType $.eType       is rw;
        has EColorSpace  $.eColorSpace is rw;
}

class TrackedDevicePose_t is repr<CStruct> is export {
        HAS HmdMatrix34_t   $.mDeviceToAbsoluteTracking;
        HAS HmdVector3_t    $.vVelocity;
        HAS HmdVector3_t    $.vAngularVelocity;
        has ETrackingResult $.eTrackingResult    is rw;
        has uint32          $.bPoseIsValid       is rw;
        has uint32          $.bDeviceIsConnected is rw;
}

class VRTextureBounds_t is repr<CStruct> is export {
        has num32 $.uMin is rw;
        has num32 $.vMin is rw;
        has num32 $.uMax is rw;
        has num32 $.vMax is rw;
}

class VRTextureWithPose_t is repr<CStruct> is export {
        HAS HmdMatrix34_t $.mDeviceToAbsoluteTracking;
}

class VRTextureDepthInfo_t is repr<CStruct> is export {
        has Pointer       $.handle; #=  Pointer *
        HAS HmdMatrix44_t $.mProjection;
        HAS HmdVector2_t  $.vRange;
}

class VRTextureWithDepth_t is repr<CStruct> is export {
        HAS VRTextureDepthInfo_t $.depth;
}

class VRTextureWithPoseAndDepth_t is repr<CStruct> is export {
        HAS VRTextureDepthInfo_t $.depth;
}

class VRVulkanTextureData_t is repr<CStruct> is export {
        has uint64             $.m_nImage             is rw;
        has VkDevice_T         $.m_pDevice            is rw; #= struct VkDevice_T *
        has VkPhysicalDevice_T $.m_pPhysicalDevice    is rw; #= struct VkPhysicalDevice_T *
        has VkInstance_T       $.m_pInstance          is rw; #= struct VkInstance_T *
        has VkQueue_T          $.m_pQueue             is rw; #= struct VkQueue_T *
        has uint32             $.m_nQueueFamilyIndex  is rw;
        has uint32             $.m_nWidth             is rw;
        has uint32             $.m_nHeight            is rw;
        has uint32             $.m_nFormat            is rw;
        has uint32             $.m_nSampleCount       is rw;
}

class D3D12TextureData_t is repr<CStruct> is export {
        has ID3D12Resource     $.m_pResource;        #= struct ID3D12Resource *
        has ID3D12CommandQueue $.m_pCommandQueue;    #= struct ID3D12CommandQueue *
        has uint32             $.m_nNodeMask is rw;
}

class VREvent_Controller_t is repr<CStruct> is export {
        has uint32 $.button is rw;
}

class VREvent_Mouse_t is repr<CStruct> is export {
        has num32  $.x      is rw;
        has num32  $.y      is rw;
        has uint32 $.button is rw;
}

class VREvent_Scroll_t is repr<CStruct> is export {
        has num32  $.xdelta        is rw;
        has num32  $.ydelta        is rw;
        has uint32 $.unused        is rw;
        has num32  $.viewportscale is rw;
}

class VREvent_TouchPadMove_t is repr<CStruct> is export {
        has uint32 $.bFingerDown         is rw;
        has num32  $.flSecondsFingerDown is rw;
        has num32  $.fValueXFirst        is rw;
        has num32  $.fValueYFirst        is rw;
        has num32  $.fValueXRaw          is rw;
        has num32  $.fValueYRaw          is rw;
}

class VREvent_Notification_t is repr<CStruct> is export {
        has uint64 $.ulUserValue    is rw;
        has uint32 $.notificationId is rw;
}

class VREvent_Process_t is repr<CStruct> is export {
        has uint32 $.pid             is rw;
        has uint32 $.oldPid          is rw;
        has uint32 $.bForced         is rw;
        has uint32 $.bConnectionLost is rw;
}

class VREvent_Overlay_t is repr<CStruct> is export {
        has uint64 $.overlayHandle is rw;
        has uint64 $.devicePath    is rw;
}

class VREvent_Status_t is repr<CStruct> is export {
        has uint32 $.statusState is rw;
}

class VREvent_Keyboard_t is repr<CStruct> is export {
        HAS Str    @.cNewInput[8] is CArray; #= char[8]
        has uint64 $.uUserValue   is rw;
}

class VREvent_Ipd_t is repr<CStruct> is export {
        has num32 $.ipdMeters is rw;
}

class VREvent_Chaperone_t is repr<CStruct> is export {
        has uint64 $.m_nPreviousUniverse is rw;
        has uint64 $.m_nCurrentUniverse  is rw;
}

class VREvent_Reserved_t is repr<CStruct> is export {
        has uint64 $!reserved0;
        has uint64 $!reserved1;
        has uint64 $!reserved2;
        has uint64 $!reserved3;
        has uint64 $!reserved4;
        has uint64 $!reserved5;
}

class VREvent_PerformanceTest_t is repr<CStruct> is export {
        has uint32 $.m_nFidelityLevel is rw;
}

class VREvent_SeatedZeroPoseReset_t is repr<CStruct> is export {
        has uint32 $.bResetBySystemMenu is rw;
}

class VREvent_Screenshot_t is repr<CStruct> is export {
        has uint32 $.handle is rw;
        has uint32 $.type is rw;
}

class VREvent_ScreenshotProgress_t is repr<CStruct> is export {
        has num32 $.progress is rw;
}

class VREvent_ApplicationLaunch_t is repr<CStruct> is export {
        has uint32 $.pid          is rw;
        has uint32 $.unArgsHandle is rw;
}

class VREvent_EditingCameraSurface_t is repr<CStruct> is export {
        has uint64 $.overlayHandle is rw;
        has uint32 $.nVisualMode   is rw;
}

class VREvent_MessageOverlay_t is repr<CStruct> is export {
        has uint32 $.unVRMessageOverlayResponse is rw;
}

class VREvent_Property_t is repr<CStruct> is export {
        has PropertyContainerHandle_t $.container is rw;
        has ETrackedDeviceProperty    $.prop      is rw;
}

class VREvent_DualAnalog_t is repr<CStruct> is export {
        has num32 $.x                is rw;
        has num32 $.y                is rw;
        has num32 $.transformedX     is rw;
        has num32 $.transformedY     is rw;
        has EDualAnalogWhich $.which is rw;
}

class VREvent_HapticVibration_t is repr<CStruct> is export {
        has uint64 $.containerHandle is rw;
        has uint64 $.componentHandle is rw;
        has num32 $.fDurationSeconds is rw;
        has num32 $.fFrequency       is rw;
        has num32 $.fAmplitude       is rw;
}

class VREvent_WebConsole_t is repr<CStruct> is export {
        has WebConsoleHandle_t $.webConsoleHandle is rw;
}

class VREvent_InputBindingLoad_t is repr<CStruct> is export {
        has PropertyContainerHandle_t $.ulAppContainer is rw;
        has uint64 $.pathMessage                       is rw;
        has uint64 $.pathUrl                           is rw;
        has uint64 $.pathControllerType                is rw;
}

class VREvent_InputActionManifestLoad_t is repr<CStruct> is export {
        has uint64 $.pathAppKey       is rw;
        has uint64 $.pathMessage      is rw;
        has uint64 $.pathMessageParam is rw;
        has uint64 $.pathManifestPath is rw;
}

class VREvent_SpatialAnchor_t is repr<CStruct> is export {
        has SpatialAnchorHandle_t $.unHandle is rw;
}

class VREvent_ProgressUpdate_t is repr<CStruct> is export {
        has uint64 $.ulApplicationPropertyContainer is rw;
        has uint64 $.pathDevice                     is rw;
        has uint64 $.pathInputSource                is rw;
        has uint64 $.pathProgressAction             is rw;
        has uint64 $.pathIcon                       is rw;
        has num32  $.fProgress                      is rw;
}

class VREvent_ShowUI_t is repr<CStruct> is export {
        has EShowUIType $.eType is rw;
}

class VREvent_ShowDevTools_t is repr<CStruct> is export {
        has int32 $.nBrowserIdentifier is rw;
}

class VREvent_HDCPError_t is repr<CStruct> is export {
        has EHDCPError $.eCode is rw;
}

class HiddenAreaMesh_t is repr<CStruct> is export {
        has HmdVector2_t $.pVertexData;           #= const struct vr::HmdVector2_t *
        has uint32       $.unTriangleCount is rw;
}

class VRControllerAxis_t is repr<CStruct> is export {
        has num32 $.x is rw;
        has num32 $.y is rw;
}

class VRControllerState_t is repr<CStruct> is export {
        has uint32 $.unPacketNum     is rw;
        has uint64 $.ulButtonPressed is rw;
        has uint64 $.ulButtonTouched is rw;
        has Pointer $.rAxis;                 #= struct vr::VRControllerAxis_t[5]
}

class Compositor_OverlaySettings is repr<CStruct> is export {
        has uint32        $.size       is rw;
        has uint32        $.curved     is rw;
        has uint32        $.antialias  is rw;
        has num32         $.scale      is rw;
        has num32         $.distance   is rw;
        has num32         $.alpha      is rw;
        has num32         $.uOffset    is rw;
        has num32         $.vOffset    is rw;
        has num32         $.uScale     is rw;
        has num32         $.vScale     is rw;
        has num32         $.gridDivs   is rw;
        has num32         $.gridWidth  is rw;
        has num32         $.gridScale  is rw;
        HAS HmdMatrix44_t $.transform;
}

class VRBoneTransform_t is repr<CStruct> is export {
        HAS HmdVector4_t     $.position;
        HAS HmdQuaternionf_t $.orientation;
}

class CameraVideoStreamFrameHeader_t is repr<CStruct> is export {
        has EVRTrackedCameraFrameType $.eFrameType          is rw;
        has uint32                    $.nWidth              is rw;
        has uint32                    $.nHeight             is rw;
        has uint32                    $.nBytesPerPixel      is rw;
        has uint32                    $.nFrameSequence      is rw;
        HAS TrackedDevicePose_t       $.trackedDevicePose;
        has uint64                    $.ulFrameExposureTime is rw;
}

class Compositor_FrameTiming is repr<CStruct> is export {
        has uint32              $.m_nSize                     is rw;
        has uint32              $.m_nFrameIndex               is rw;
        has uint32              $.m_nNumFramePresents         is rw;
        has uint32              $.m_nNumMisPresented          is rw;
        has uint32              $.m_nNumDroppedFrames         is rw;
        has uint32              $.m_nReprojectionFlags        is rw;
        has num64               $.m_flSystemTimeInSeconds     is rw;
        has num32               $.m_flPreSubmitGpuMs          is rw;
        has num32               $.m_flPostSubmitGpuMs         is rw;
        has num32               $.m_flTotalRenderGpuMs        is rw;
        has num32               $.m_flCompositorRenderGpuMs   is rw;
        has num32               $.m_flCompositorRenderCpuMs   is rw;
        has num32               $.m_flCompositorIdleCpuMs     is rw;
        has num32               $.m_flClientFrameIntervalMs   is rw;
        has num32               $.m_flPresentCallCpuMs        is rw;
        has num32               $.m_flWaitForPresentCpuMs     is rw;
        has num32               $.m_flSubmitFrameMs           is rw;
        has num32               $.m_flWaitGetPosesCalledMs    is rw;
        has num32               $.m_flNewPosesReadyMs         is rw;
        has num32               $.m_flNewFrameReadyMs         is rw;
        has num32               $.m_flCompositorUpdateStartMs is rw;
        has num32               $.m_flCompositorUpdateEndMs   is rw;
        has num32               $.m_flCompositorRenderStartMs is rw;
        HAS TrackedDevicePose_t $.m_HmdPose;
        has uint32              $.m_nNumVSyncsReadyForUse     is rw;
        has uint32              $.m_nNumVSyncsToFirstView     is rw;
}

class DriverDirectMode_FrameTiming is repr<CStruct> is export {
        has uint32 $.m_nSize              is rw;
        has uint32 $.m_nNumFramePresents  is rw;
        has uint32 $.m_nNumMisPresented   is rw;
        has uint32 $.m_nNumDroppedFrames  is rw;
        has uint32 $.m_nReprojectionFlags is rw;
}

class ImuSample_t is repr<CStruct> is export {
        has num64         $.fSampleTime     is rw;
        HAS HmdVector3d_t $.vAccel;
        HAS HmdVector3d_t $.vGyro;
        has uint32        $.unOffScaleFlags is rw;
}

class AppOverrideKeys_t is repr<CStruct> is export {
        has Str $.pchKey   is rw; #= const char *
        has Str $.pchValue is rw; #= const char *
}

class Compositor_CumulativeStats is repr<CStruct> is export {
        has uint32 $.m_nPid                           is rw;
        has uint32 $.m_nNumFramePresents              is rw;
        has uint32 $.m_nNumDroppedFrames              is rw;
        has uint32 $.m_nNumReprojectedFrames          is rw;
        has uint32 $.m_nNumFramePresentsOnStartup     is rw;
        has uint32 $.m_nNumDroppedFramesOnStartup     is rw;
        has uint32 $.m_nNumReprojectedFramesOnStartup is rw;
        has uint32 $.m_nNumLoading                    is rw;
        has uint32 $.m_nNumFramePresentsLoading       is rw;
        has uint32 $.m_nNumDroppedFramesLoading       is rw;
        has uint32 $.m_nNumReprojectedFramesLoading   is rw;
        has uint32 $.m_nNumTimedOut                   is rw;
        has uint32 $.m_nNumFramePresentsTimedOut      is rw;
        has uint32 $.m_nNumDroppedFramesTimedOut      is rw;
        has uint32 $.m_nNumReprojectedFramesTimedOut  is rw;
}

class VROverlayIntersectionParams_t is repr<CStruct> is export {
        HAS HmdVector3_t            $.vSource;
        HAS HmdVector3_t            $.vDirection;
        has ETrackingUniverseOrigin $.eOrigin is rw;
}

class VROverlayIntersectionResults_t is repr<CStruct> is export {
        HAS HmdVector3_t $.vPoint;
        HAS HmdVector3_t $.vNormal;
        HAS HmdVector2_t $.vUVs;
        has num32        $.fDistance is rw;
}

class IntersectionMaskRectangle_t is repr<CStruct> is export {
        has num32 $.m_flTopLeftX is rw;
        has num32 $.m_flTopLeftY is rw;
        has num32 $.m_flWidth    is rw;
        has num32 $.m_flHeight   is rw;
}

class IntersectionMaskCircle_t is repr<CStruct> is export {
        has num32 $.m_flCenterX is rw;
        has num32 $.m_flCenterY is rw;
        has num32 $.m_flRadius  is rw;
}

class RenderModel_ComponentState_t is repr<CStruct> is export {
        HAS HmdMatrix34_t         $.mTrackingToComponentRenderModel;
        HAS HmdMatrix34_t         $.mTrackingToComponentLocal;
        has VRComponentProperties $.uProperties                     is rw;
}

class RenderModel_Vertex_t is repr<CStruct> is export does Indexable {
        HAS HmdVector3_t $.vPosition;
        HAS HmdVector3_t $.vNormal;
        HAS num32        @!rfTextureCoord[2] is CArray; #num32[2]
}

class RenderModel_TextureMap_t is repr<CStruct> is export {
        has uint16        $.unWidth           is rw;
        has uint16        $.unHeight          is rw;
        has CArray[uint8] $.rubTextureMapData; #= const uint8_t *
}

class RenderModel_t is repr<CStruct> is export {
        has RenderModel_Vertex_t $.rVertexData;     #= const struct vr::RenderModel_Vertex_t *
        has uint32               $.unVertexCount    is rw;
        has CArray[uint16]       $.rIndexData;      #= const uint16_t *
        has uint32               $.unTriangleCount  is rw;
        has TextureID_t          $.diffuseTextureId is rw;
}

class RenderModel_ControllerMode_State_t is repr<CStruct> is export {
        has uint32 $.bScrollWheelVisible is rw;
}

class NotificationBitmap_t is repr<CStruct> is export {
        has Pointer $.m_pImageData;    #= Pointer *
        has int32   $.m_nWidth         is rw;
        has int32   $.m_nHeight        is rw;
        has int32   $.m_nBytesPerPixel is rw;
}

class CVRSettingHelper is repr<CStruct> is export {
        has Pointer $.m_pSettings is rw; #= class vr::IVRSettings *
}

class InputAnalogActionData_t is repr<CStruct> is export {
        has uint32               $.bActive      is rw;
        has VRInputValueHandle_t $.activeOrigin is rw;
        has num32                $.x            is rw;
        has num32                $.y            is rw;
        has num32                $.z            is rw;
        has num32                $.deltaX       is rw;
        has num32                $.deltaY       is rw;
        has num32                $.deltaZ       is rw;
        has num32                $.fUpdateTime  is rw;
}

class InputDigitalActionData_t is repr<CStruct> is export {
        has uint32               $.bActive      is rw;
        has VRInputValueHandle_t $.activeOrigin is rw;
        has uint32               $.bState       is rw;
        has uint32               $.bChanged     is rw;
        has num32                $.fUpdateTime  is rw;
}

class InputPoseActionData_t is repr<CStruct> is export {
        has uint32 $.bActive is rw;
        has VRInputValueHandle_t $.activeOrigin is rw;
        has TrackedDevicePose_t $.pose is rw; #= struct TrackedDevicePose_t
}

class InputSkeletalActionData_t is repr<CStruct> is export {
        has uint32 $.bActive is rw;
        has VRInputValueHandle_t $.activeOrigin is rw;
}

sub setCharArray($a, $s, $l, $c is rw) {
  X::OpenVR::ExcessiveStringLength.new.throw unless $s.chars <= $l;

  $c = $s if $c;
  my $chars = $a.encode;
  $a[$_] = $chars[$_] for ^$chars.elems;
  $a[$chars.elems] = 0 unless $s.elems == 128;
}

class InputOriginInfo_t is repr<CStruct> is export {
        has VRInputValueHandle_t $.devicePath                       is rw;
        has TrackedDeviceIndex_t $.trackedDeviceIndex               is rw;
        HAS uint8                @!rchRenderModelComponentName[128] is CArray; #= char[128]

        method rchrenderModelComponentName is rw {
          state Str $cached;

          Proxy.new:
            FETCH => sub ($) {
              return if $cached;
              $cached = Buf.new(@!rchRenderModelComponentName).decode
            },

            STORE => -> $, Str $s is raw {
              setCharArray(@!rchRenderModelComponentName, $s, 128, $cached);
            }
        }
}

class InputBindingInfo_t is repr<CStruct> is export {
        HAS uint8 @!rchDevicePathName[128] is CArray; #= char[128]
        HAS uint8 @!rchInputPathName[128]  is CArray; #= char[128]
        HAS uint8 @!rchModeName[128]       is CArray; #= char[128]
        HAS uint8 @!rchSlotName[128]       is CArray; #= char[128]

        method rchDevicePathName is rw {
          state Str $cached;

          Proxy.new:
            FETCH => sub ($) {
              return if $cached;
              $cached = Buf.new(@!rchDevicePathName).decode
            },

            STORE => -> $, Str $s is raw {
              setCharArray(@!rchDevicePathName, $s, 128, $cached);
            }
        }

        method rchInputPathName is rw {
          state Str $cached;

          Proxy.new:
            FETCH => sub ($) {
              return if $cached;
              $cached = Buf.new(@!rchInputPathName).decode
            },

            STORE => -> $, Str $s is raw {
              setCharArray(@!rchInputPathName, $s, 128, $cached);
            }
        }

        method rchModeName is rw {
          state Str $cached;

          Proxy.new:
            FETCH => sub ($) {
              return if $cached;
              $cached = Buf.new(@!rchModeName).decode
            },

            STORE => -> $, Str $s is raw {
              setCharArray(@!rchModeName, $s, 128, $cached);
            }
        }

        method rchSlotName is rw {
          state Str $cached;

          Proxy.new:
            FETCH => sub ($) {
              return if $cached;
              $cached = Buf.new(@!rchSlotName).decode
            },

            STORE => -> $, Str $s is raw {
              setCharArray(@!rchSlotName, $s, 128, $cached);
            }
        }
}

class VRActiveActionSet_t is repr<CStruct> is export {
        has VRActionSetHandle_t  $.ulActionSet          is rw;
        has VRInputValueHandle_t $.ulRestrictedToDevice is rw;
        has VRActionSetHandle_t  $.ulSecondaryActionSet is rw;
        has uint32               $.unPadding            is rw;
        has int32                $.nPriority            is rw;
}

class VRSkeletalSummaryData_t is repr<CStruct> is export does Indexable {
        has num32 @!flFingerCurl[5]  is CArray;  #= num32[5]
        has num32 @!flFingerSplay[4] is CArray;  #= num32[4]
}

class SpatialAnchorPose_t is repr<CStruct> is export {
        HAS HmdMatrix34_t $.mAnchorToAbsoluteTracking; #= struct HmdMatrix34_t
}

class COpenVRContext is repr<CStruct> is export  {
        has Pointer $.m_pVRSystem          is rw; #= class vr::IVRSystem          *
        has Pointer $.m_pVRChaperone       is rw; #= class vr::IVRChaperone       *
        has Pointer $.m_pVRChaperoneSetup  is rw; #= class vr::IVRChaperoneSetup  *
        has Pointer $.m_pVRCompositor      is rw; #= class vr::IVRCompositor      *
        has Pointer $.m_pVROverlay         is rw; #= class vr::IVROverlay         *
        has Pointer $.m_pVRResources       is rw; #= class vr::IVRResources       *
        has Pointer $.m_pVRRenderModels    is rw; #= class vr::IVRRenderModels    *
        has Pointer $.m_pVRExtendedDisplay is rw; #= class vr::IVRExtendedDisplay *
        has Pointer $.m_pVRSettings        is rw; #= class vr::IVRSettings        *
        has Pointer $.m_pVRApplications    is rw; #= class vr::IVRApplications    *
        has Pointer $.m_pVRTrackedCamera   is rw; #= class vr::IVRTrackedCamera   *
        has Pointer $.m_pVRScreenshots     is rw; #= class vr::IVRScreenshots     *
        has Pointer $.m_pVRDriverManager   is rw; #= class vr::IVRDriverManager   *
        has Pointer $.m_pVRInput           is rw; #= class vr::IVRInput           *
        has Pointer $.m_pVRIOBuffer        is rw; #= class vr::IVRIOBuffer        *
        has Pointer $.m_pVRSpatialAnchors  is rw; #= class vr::IVRSpatialAnchors  *
        has Pointer $.m_pVRDebug           is rw; #= class vr::IVRDebug           *
        has Pointer $.m_pVRNotifications   is rw; #= class vr::IVRNotifications   *
}

class VREvent_Data_t is repr<CUnion> is export  {
        HAS VREvent_Reserved_t                $.reserved;
        HAS VREvent_Controller_t              $.controller;
        HAS VREvent_Mouse_t                   $.mouse;
        HAS VREvent_Scroll_t                  $.scroll;
        HAS VREvent_Process_t                 $.process;
        HAS VREvent_Notification_t            $.notification;
        HAS VREvent_Overlay_t                 $.overlay;
        HAS VREvent_Status_t                  $.status;
        HAS VREvent_Keyboard_t                $.keyboard;
        HAS VREvent_Ipd_t                     $.ipd;
        HAS VREvent_Chaperone_t               $.chaperone;
        HAS VREvent_PerformanceTest_t         $.performanceTest;
        HAS VREvent_TouchPadMove_t            $.touchPadMove;
        HAS VREvent_SeatedZeroPoseReset_t     $.seatedZeroPoseReset;
        HAS VREvent_Screenshot_t              $.screenshot;
        HAS VREvent_ScreenshotProgress_t      $.screenshotProgress;
        HAS VREvent_ApplicationLaunch_t       $.applicationLaunch;
        HAS VREvent_EditingCameraSurface_t    $.cameraSurface;
        HAS VREvent_MessageOverlay_t          $.messageOverlay;
        HAS VREvent_Property_t                $.property;
        HAS VREvent_DualAnalog_t              $.dualAnalog;
        HAS VREvent_HapticVibration_t         $.hapticVibration;
        HAS VREvent_WebConsole_t              $.webConsole;
        HAS VREvent_InputBindingLoad_t        $.inputBinding;
        HAS VREvent_InputActionManifestLoad_t $.actionManifest;
        HAS VREvent_SpatialAnchor_t           $.spatialAnchor;
}

class VREvent_t is repr<CStruct> is export  {
        has uint32               $.eventType          is   rw; #=  EVREventType enum
        has TrackedDeviceIndex_t $.trackedDeviceIndex is   rw;
        has num32                $.eventAgeSeconds    is   rw;
        # event data must be the end of the struct as its size is variable
        HAS VREvent_Data_t       $.data;
}

class VROverlayIntersectionMaskPrimitive_Data_t is repr<CUnion> is export  {
        HAS IntersectionMaskRectangle_t $.m_Rectangle;
        HAS IntersectionMaskCircle_t    $.m_Circle;
}

class VROverlayIntersectionMaskPrimitive_t is repr<CStruct> is export  {
        has EVROverlayIntersectionMaskPrimitiveType   $.m_nPrimitiveType;
        HAS VROverlayIntersectionMaskPrimitive_Data_t $.m_Primitive;
}

# timotimo++ x Inf - For the function pointer strategy
# See: https://colabti.org/irclogger/irclogger_log/perl6?date=2019-09-21#l585

class VR_IVRApplications_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!AddApplicationManifest;               #= EVRApplicationError (char * pchApplicationManifestFullPath, bool bTemporary);
        has Pointer $!RemoveApplicationManifest;            #= EVRApplicationError (char * pchApplicationManifestFullPath);
        has Pointer $!IsApplicationInstalled;               #= bool (char * pchAppKey);
        has Pointer $!GetApplicationCount;                  #= uint32_t ();
        has Pointer $!GetApplicationKeyByIndex;             #= EVRApplicationError (uint32_t unApplicationIndex, char * pchAppKeyBuffer, uint32_t unAppKeyBufferLen);
        has Pointer $!GetApplicationKeyByProcessId;         #= EVRApplicationError (uint32_t unProcessId, char * pchAppKeyBuffer, uint32_t unAppKeyBufferLen);
        has Pointer $!LaunchApplication;                    #= EVRApplicationError (char * pchAppKey);
        has Pointer $!LaunchTemplateApplication;            #= EVRApplicationError (char * pchTemplateAppKey, char * pchNewAppKey, struct AppOverrideKeys_t * pKeys, uint32_t unKeys);
        has Pointer $!LaunchApplicationFromMimeType;        #= EVRApplicationError (char * pchMimeType, char * pchArgs);
        has Pointer $!LaunchDashboardOverlay;               #= EVRApplicationError (char * pchAppKey);
        has Pointer $!CancelApplicationLaunch;              #= bool (char * pchAppKey);
        has Pointer $!IdentifyApplication;                  #= EVRApplicationError (uint32_t unProcessId, char * pchAppKey);
        has Pointer $!GetApplicationProcessId;              #= uint32_t (char * pchAppKey);
        has Pointer $!GetApplicationsErrorNameFromEnum;     #= char * (EVRApplicationError error);
        has Pointer $!GetApplicationPropertyString;         #= uint32_t (char * pchAppKey, EVRApplicationProperty eProperty, char * pchPropertyValueBuffer, uint32_t unPropertyValueBufferLen, EVRApplicationError * peError);
        has Pointer $!GetApplicationPropertyBool;           #= bool (char * pchAppKey, EVRApplicationProperty eProperty, EVRApplicationError * peError);
        has Pointer $!GetApplicationPropertyUint64;         #= uint64_t (char * pchAppKey, EVRApplicationProperty eProperty, EVRApplicationError * peError);
        has Pointer $!SetApplicationAutoLaunch;             #= EVRApplicationError (char * pchAppKey, bool bAutoLaunch);
        has Pointer $!GetApplicationAutoLaunch;             #= bool (char * pchAppKey);
        has Pointer $!SetDefaultApplicationForMimeType;     #= EVRApplicationError (char * pchAppKey, char * pchMimeType);
        has Pointer $!GetDefaultApplicationForMimeType;     #= bool (char * pchMimeType, char * pchAppKeyBuffer, uint32_t unAppKeyBufferLen);
        has Pointer $!GetApplicationSupportedMimeTypes;     #= bool (char * pchAppKey, char * pchMimeTypesBuffer, uint32_t unMimeTypesBuffer);
        has Pointer $!GetApplicationsThatSupportMimeType;   #= uint32_t (char * pchMimeType, char * pchAppKeysThatSupportBuffer, uint32_t unAppKeysThatSupportBuffer);
        has Pointer $!GetApplicationLaunchArguments;        #= uint32_t (uint32_t unHandle, char * pchArgs, uint32_t unArgs);
        has Pointer $!GetStartingApplication;               #= EVRApplicationError (char * pchAppKeyBuffer, uint32_t unAppKeyBufferLen);
        has Pointer $!GetSceneApplicationState;             #= EVRSceneApplicationState ();
        has Pointer $!PerformApplicationPrelaunchCheck;     #= EVRApplicationError (char * pchAppKey);
        has Pointer $!GetSceneApplicationStateNameFromEnum; #= char * (EVRSceneApplicationState state);
        has Pointer $!LaunchInternalProcess;                #= EVRApplicationError (char * pchBinaryPath, char * pchArguments, char * pchWorkingDirectory);
        has Pointer $!GetCurrentSceneProcessId;             #= uint32_t ();

        method AddApplicationManifest (Str $amfp, bool $bt) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str, bool --> EVRApplicationError),
              $!AddApplicationManifest
            )($amfp, $bt)
          )
        }

        method RemoveApplicationManifest (Str $amfp) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str --> EVRApplicationError),
              $!RemoveApplicationManifest
            )($amfp)
          )
        }

        method IsApplicationInstalled (Str $ak) {
          so nativecast(
            :(Str --> bool),
            $!IsApplicationInstalled
          )($ak);
        }

        method GetApplicationCount {
          nativecast(
            :(--> uint32),
            $!GetApplicationCount
          )();
        }

        method GetApplicationKeyByIndex (uint32 $ai, Str $akb, uint32 $akbl) {
          EVRApplicationErrorEnum(
            nativecast(
              :(uint32, Str, uint32 --> EVRApplicationError),
              $!GetApplicationKeyByIndex
            )($ai, $akb, $akbl)
          )
        }

        method GetApplicationKeyByProcessId (
          uint32 $pid,
          Str    $akb,
          uint32 $akbl
        ) {
          EVRApplicationErrorEnum(
            nativecast(
              :(uint32, Str, uint32 --> EVRApplicationError),
              $!GetApplicationKeyByProcessId
            )($pid, $akb, $akbl)
          )
        }

        method LaunchApplication (Str $ak) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str --> EVRApplicationError),
              $!LaunchApplication
            )($ak)
          );
        }

        method LaunchTemplateApplication (
          Str               $nak,
          Str               $tak,
          AppOverrideKeys_t $k,
          uint32            $k2
        ) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str, Str, AppOverrideKeys_t, uint32 --> EVRApplicationError),
              $!LaunchTemplateApplication
            )($tak, $nak, $k, $k2)
          );
        }

        method LaunchApplicationFromMimeType (Str $mt, Str $a) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str, Str --> EVRApplicationError),
              $!LaunchApplicationFromMimeType
            )($mt, $a)
          );
        }

        method LaunchDashboardOverlay (Str $ak) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str --> EVRApplicationError),
              $!LaunchDashboardOverlay
            )($ak)
          );
        }

        method CancelApplicationLaunch (Str $ak) {
          nativecast(
            :(Str --> bool),
            $!CancelApplicationLaunch
          )($ak)
        }

        method IdentifyApplication (uint32 $pi, Str $ak) {
          EVRApplicationErrorEnum(
            nativecast(
              :(uint32, Str --> EVRApplicationError),
              $!IdentifyApplication
            )($pi, $ak)
          );
        }

        method GetApplicationProcessId (Str $ak) {
          nativecast(
            :(Str --> uint32),
            $!GetApplicationProcessId
          )($ak)
        }

        method GetApplicationsErrorNameFromEnum (EVRApplicationError $e) {
          nativecast(
            :(EVRApplicationError --> Str),
            $!GetApplicationsErrorNameFromEnum
          )($e)
        }

        method GetApplicationPropertyString (
          Str                    $ak,
          EVRApplicationProperty $p,
          Str                    $pvb,
          uint32                 $pvbl,
          EVRApplicationError    $e
        ) {
          nativecast(
            :(Str, EVRApplicationProperty, Str, uint32, EVRApplicationError --> uint32),
            $!GetApplicationPropertyString
          )($ak, $p, $pvb, $pvbl, $e)
        }

        method GetApplicationPropertyBool (
          Str                    $ak,
          EVRApplicationProperty $p,
          EVRApplicationError    $e
        ) {
          nativecast(
            :(Str, EVRApplicationProperty, EVRApplicationError --> bool),
            $!GetApplicationPropertyBool
          )($ak, $p, $e)
        }

        method GetApplicationPropertyUint64 (
          Str                    $ak,
          EVRApplicationProperty $p,
          EVRApplicationError    $e
        ) {
          nativecast(
            :(Str, EVRApplicationProperty, EVRApplicationError --> uint64),
            $!GetApplicationPropertyUint64
          )($ak, $p, $e)
        }

        method SetApplicationAutoLaunch (Str $ak, bool $al) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str, bool --> EVRApplicationError),
              $!SetApplicationAutoLaunch
            )($ak, $al)
          );
        }

        method GetApplicationAutoLaunch (Str $ak) {
          nativecast(
            :(Str --> bool),
            $!GetApplicationAutoLaunch
          )($ak)
        }

        method SetDefaultApplicationForMimeType (Str $ak, Str $mt) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str, Str --> EVRApplicationError),
              $!SetDefaultApplicationForMimeType
            )($ak, $mt)
          );
        }

        method GetDefaultApplicationForMimeType (
          Str    $mt,
          Str    $akb,
          uint32 $akbl
        ) {
          nativecast(
            :(Str, Str, uint32 --> bool),
            $!GetDefaultApplicationForMimeType
          )($mt, $akb, $akbl)
        }

        method GetApplicationSupportedMimeTypes (
          Str    $ak,
          Str    $mtb,
          uint32 $mtb2
        ) {
          nativecast(
            :(Str, Str, uint32 --> bool),
            $!GetApplicationSupportedMimeTypes
          )($ak, $mtb, $mtb2)
        }

        method GetApplicationsThatSupportMimeType (
          Str    $mt,
          Str    $aktsb,
          uint32 $aktsb2
        ) {
          nativecast(
            :(Str, Str, uint32 --> uint32),
            $!GetApplicationsThatSupportMimeType
          )($mt, $aktsb, $aktsb2)
        }

        method GetApplicationLaunchArguments (uint32 $h, Str $a, uint32 $a2) {
          nativecast(
            :(uint32, Str, uint32 --> uint32),
            $!GetApplicationLaunchArguments
          )($h, $a, $a2)
        }

        method GetStartingApplication (Str $akb, uint32 $akbl) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str, uint32 --> EVRApplicationError),
              $!GetStartingApplication
            )($akb, $akbl)
          );
        }

        method GetSceneApplicationState {
          EVRSceneApplicationStateEnum(
            nativecast(
              :( --> EVRSceneApplicationState),
              $!GetSceneApplicationState
            )()
          );
        }

        method PerformApplicationPrelaunchCheck (Str $ak) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str --> EVRApplicationError),
              $!PerformApplicationPrelaunchCheck
            )($ak)
          );
        }

        method GetSceneApplicationStateNameFromEnum (
          EVRSceneApplicationState $s
        ) {
          nativecast(
            :(EVRSceneApplicationState --> Str),
            $!GetSceneApplicationStateNameFromEnum
          )($s)
        }

        method LaunchInternalProcess (Str $bp, Str $a, Str $wd) {
          EVRApplicationErrorEnum(
            nativecast(
              :(Str, Str, Str --> EVRApplicationError),
              $!LaunchInternalProcess
            )($bp, $a, $wd)
          );
        }

        method GetCurrentSceneProcessId {
          nativecast(
            :( --> uint32),
            $!GetCurrentSceneProcessId
          )()
        }

}

class VR_IVRExtendedDisplay_FnTable is repr<CStruct> is export {
        has Pointer $!GetWindowBounds     ;  #= (int32_t * pnX, int32_t * pnY, uint32_t * pnWidth, uint32_t * pnHeight);
        has Pointer $!GetEyeOutputViewport;  #= (EVREye eEye, uint32_t * pnX, uint32_t * pnY, uint32_t * pnWidth, uint32_t * pnHeight);
        has Pointer $!GetDXGIOutputInfo   ;  #= (int32_t * pnAdapterIndex, int32_t * pnAdapterOutputIndex);

        method GetWindowBounds (
          int32  $p  is rw,
          int32  $p2 is rw,
          uint32 $w  is rw,
          uint32 $h  is rw
        ) {
          nativecast(
            :(int32 is rw, int32 is rw, uint32 is rw, uint32 is rw),
            $!GetWindowBounds
          )($p, $p2, $w, $h)
        }

        method GetEyeOutputViewport (
          EVREye $e,
          uint32 $p  is rw,
          uint32 $p2 is rw,
          uint32 $w  is rw,
          uint32 $h  is rw
        ) {
          nativecast(
            :(
              EVREye is rw,
              uint32 is rw,
              uint32 is rw,
              uint32 is rw,
              uint32 is rw
            ),
            $!GetEyeOutputViewport
          )($e, $p, $p2, $w, $h)
        }

        method GetDXGIOutputInfo (int32 $ai is rw, int32 $aoi is rw) {
          nativecast(
            :(int32 is rw, int32 is rw),
            $!GetDXGIOutputInfo
          )($ai, $aoi)
        }

}

class VR_IVRTrackedCamera_FnTable is export does OpenVRInterface  {
    has Pointer $!GetCameraErrorNameFromEnum;   #= char * (EVRTrackedCameraError eCameraError);
    has Pointer $!HasCamera;                    #= EVRTrackedCameraError (TrackedDeviceIndex_t nDeviceIndex, bool * pHasCamera);
    has Pointer $!GetCameraFrameSize;           #= EVRTrackedCameraError (TrackedDeviceIndex_t nDeviceIndex, EVRTrackedCameraFrameType eFrameType, uint32_t * pnWidth, uint32_t * pnHeight, uint32_t * pnFrameBufferSize);
    has Pointer $!GetCameraIntrinsics;          #= EVRTrackedCameraError (TrackedDeviceIndex_t nDeviceIndex, uint32_t nCameraIndex, EVRTrackedCameraFrameType eFrameType, HmdVector2_t * pFocalLength, HmdVector2_t * pCenter);
    has Pointer $!GetCameraProjection;          #= EVRTrackedCameraError (TrackedDeviceIndex_t nDeviceIndex, uint32_t nCameraIndex, EVRTrackedCameraFrameType eFrameType, float flZNear, float flZFar, HmdMatrix44_t * pProjection);
    has Pointer $!AcquireVideoStreamingService; #= EVRTrackedCameraError (TrackedDeviceIndex_t nDeviceIndex, TrackedCameraHandle_t * pHandle);
    has Pointer $!ReleaseVideoStreamingService; #= EVRTrackedCameraError (TrackedCameraHandle_t hTrackedCamera);
    has Pointer $!GetVideoStreamFrameBuffer;    #= EVRTrackedCameraError (TrackedCameraHandle_t hTrackedCamera, EVRTrackedCameraFrameType eFrameType, Pointer * pFrameBuffer, uint32_t nFrameBufferSize, CameraVideoStreamFrameHeader_t * pFrameHeader, uint32_t nFrameHeaderSize);
    has Pointer $!GetVideoStreamTextureSize;    #= EVRTrackedCameraError (TrackedDeviceIndex_t nDeviceIndex, EVRTrackedCameraFrameType eFrameType, VRTextureBounds_t * pTextureBounds, uint32_t * pnWidth, uint32_t * pnHeight);
    has Pointer $!GetVideoStreamTextureD3D11;   #= EVRTrackedCameraError (TrackedCameraHandle_t hTrackedCamera, EVRTrackedCameraFrameType eFrameType, Pointer * pD3D11DeviceOrResource, Pointer ** ppD3D11ShaderResourceView, CameraVideoStreamFrameHeader_t * pFrameHeader, uint32_t nFrameHeaderSize);
    has Pointer $!GetVideoStreamTextureGL;      #= EVRTrackedCameraError (TrackedCameraHandle_t hTrackedCamera, EVRTrackedCameraFrameType eFrameType, glUInt_t * pglTextureId, CameraVideoStreamFrameHeader_t * pFrameHeader, uint32_t nFrameHeaderSize);
    has Pointer $!ReleaseVideoStreamTextureGL;  #= EVRTrackedCameraError (TrackedCameraHandle_t hTrackedCamera, glUInt_t glTextureId);
    has Pointer $!SetCameraTrackingSpace;       #= Pointer (ETrackingUniverseOrigin eUniverse);
    has Pointer $!GetCameraTrackingSpace;       #= ETrackingUniverseOrigin ();

    method GetCameraErrorNameFromEnum (EVRTrackedCameraError $ce is rw) {
      nativecast(
        :(EVRTrackedCameraError is rw --> Str),
        $!GetCameraErrorNameFromEnum
      )($ce)
    }

    method HasCamera (TrackedDeviceIndex_t $di is rw, bool $hc is rw) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(TrackedDeviceIndex_t is rw, bool is rw --> EVRTrackedCameraError),
          $!HasCamera
        )($di, $hc)
      );
    }

    method GetCameraFrameSize (
      TrackedDeviceIndex_t      $di  is rw,
      EVRTrackedCameraFrameType $ft  is rw,
      uint32                    $w   is rw,
      uint32                    $h   is rw,
      uint32                    $fbs is rw
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedDeviceIndex_t      is rw,
            EVRTrackedCameraFrameType is rw,
            uint32                    is rw,
            uint32                    is rw,
            uint32                    is rw
            --> EVRTrackedCameraError
          ),
          $!GetCameraFrameSize
        )($di, $ft, $w, $h, $fbs)
      );
    }

    method GetCameraIntrinsics (
      TrackedDeviceIndex_t      $di is rw,
      uint32                    $ci,
      EVRTrackedCameraFrameType $ft is rw,
      HmdVector2_t              $fl,
      HmdVector2_t              $c
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedDeviceIndex_t      is rw,
            uint32,
            EVRTrackedCameraFrameType is rw,
            HmdVector2_t,
            HmdVector2_t
            --> EVRTrackedCameraError
          ),
          $!GetCameraIntrinsics
        )($di, $ci, $ft, $fl, $c)
      );
    }

    method GetCameraProjection (
      TrackedDeviceIndex_t      $di is rw,
      uint32                    $ci,
      EVRTrackedCameraFrameType $ft is rw,
      num32                     $n,
      num32                     $f,
      HmdMatrix44_t             $p
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedDeviceIndex_t      is rw,
            uint32,
            EVRTrackedCameraFrameType is rw,
            num32,
            num32,
            HmdMatrix44_t
            --> EVRTrackedCameraError
          ),
          $!GetCameraProjection
        )($di, $ci, $ft, $n, $f, $p)
      );
    }

    method AcquireVideoStreamingService (
      TrackedDeviceIndex_t  $di is rw,
      TrackedCameraHandle_t $h  is rw
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedDeviceIndex_t  is rw,
            TrackedCameraHandle_t is rw
            --> EVRTrackedCameraError
          ),
          $!AcquireVideoStreamingService
        )($di, $h)
      );
    }

    method ReleaseVideoStreamingService (TrackedCameraHandle_t $tc is rw) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(TrackedCameraHandle_t is rw --> EVRTrackedCameraError),
          $!ReleaseVideoStreamingService
        )($tc)
      );
    }

    method GetVideoStreamFrameBuffer (
      TrackedCameraHandle_t          $tc is rw,
      EVRTrackedCameraFrameType      $ft is rw,
      Pointer                        $fb,
      uint32                         $fbs,
      CameraVideoStreamFrameHeader_t $fh,
      uint32                         $fhs
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedCameraHandle_t          is rw,
            EVRTrackedCameraFrameType      is rw,
            Pointer,
            uint32,
            CameraVideoStreamFrameHeader_t,
            uint32
            --> EVRTrackedCameraError
          ),
          $!GetVideoStreamFrameBuffer
        )($tc, $ft, $fb, $fbs, $fh, $fhs)
      );
    }

    method GetVideoStreamTextureSize (
      TrackedDeviceIndex_t      $di is rw,
      EVRTrackedCameraFrameType $ft is rw,
      VRTextureBounds_t         $tb,
      uint32                    $w  is rw,
      uint32                    $h  is rw
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedDeviceIndex_t      is rw,
            EVRTrackedCameraFrameType is rw,
            VRTextureBounds_t,
            uint32                    is rw,
            uint32                    is rw
            --> EVRTrackedCameraError
          ),
          $!GetVideoStreamTextureSize
        )($di, $ft, $tb, $w, $h)
      );
    }

    method GetVideoStreamTextureD3D11 (
      TrackedCameraHandle_t          $tc  is rw,
      EVRTrackedCameraFrameType      $ft  is rw,
      Pointer                        $dor is rw,
      CameraVideoStreamFrameHeader_t $fh,
      uint32                         $fhs
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedCameraHandle_t          is rw,
            EVRTrackedCameraFrameType      is rw,
            Pointer,
            CameraVideoStreamFrameHeader_t,
            uint32
            --> EVRTrackedCameraError
          ),
          $!GetVideoStreamTextureD3D11
        )($tc, $ft, $dor, $fh, $fhs)
      );
    }

    method GetVideoStreamTextureGL (
      TrackedCameraHandle_t          $tc  is rw,
      EVRTrackedCameraFrameType      $ft  is rw,
      glUInt_t                       $ti  is rw,
      CameraVideoStreamFrameHeader_t $fh,
      uint32                         $fhs
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedCameraHandle_t          is rw,
            EVRTrackedCameraFrameType      is rw,
            glUInt_t                       is rw,
            CameraVideoStreamFrameHeader_t,
            uint32
            --> EVRTrackedCameraError
          ),
          $!GetVideoStreamTextureGL
        )($tc, $ft, $ti, $fh, $fhs)
      );
    }

    method ReleaseVideoStreamTextureGL (
      TrackedCameraHandle_t $tc is rw,
      glUInt_t              $ti is rw
    ) {
      EVRTrackedCameraErrorEnum(
        nativecast(
          :(
            TrackedCameraHandle_t     is rw,
            glUInt_t                  is rw
            --> EVRTrackedCameraError
          ),
          $!ReleaseVideoStreamTextureGL
        )($tc, $ti)
      );
    }

    method SetCameraTrackingSpace (ETrackingUniverseOrigin $u is rw) {
      nativecast(
        :(ETrackingUniverseOrigin is rw --> Pointer),
        $!SetCameraTrackingSpace
      )($u)
    }

    method GetCameraTrackingSpace {
      ETrackingUniverseOriginEnum(
        nativecast(
          :( --> ETrackingUniverseOrigin),
          $!GetCameraTrackingSpace
        )()
      );
    }

}

class VR_IVRChaperone_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!GetCalibrationState; #= ChaperoneCalibrationState();
        has Pointer $!GetPlayAreaSize;     #= bool (float * pSizeX, float * pSizeZ);
        has Pointer $!GetPlayAreaRect;     #= bool (struct HmdQuad_t * rect);
        has Pointer $!ReloadInfo;          #= ();
        has Pointer $!SetSceneColor;       #= (struct HmdColor_t color);
        has Pointer $!GetBoundsColor;      #= (struct HmdColor_t * pOutputColorArray, int nNumOutputColors, float flCollisionBoundsFadeDistance, struct HmdColor_t * pOutputCameraColor);
        has Pointer $!AreBoundsVisible;    #= bool ();
        has Pointer $!ForceBoundsVisible;  #= (bool bForce);

        method GetCalibrationState {
          ChaperoneCalibrationStateEnum(
            nativecast(
              :( --> ChaperoneCalibrationState),
              $!GetCalibrationState
            )()
          );
        }

        method GetPlayAreaSize (num32 $s, num32 $s2) {
          nativecast(
            :(num32, num32 --> bool),
            $!GetPlayAreaSize
          )($s, $s2)
        }

        method GetPlayAreaRect (HmdQuad_t $r) {
          nativecast(
            :(HmdQuad_t --> bool),
            $!GetPlayAreaRect
          )($r)
        }

        method ReloadInfo {
          nativecast(
            :(),
            $!ReloadInfo
          )()
        }

        method SetSceneColor (HmdColor_t $c) {
          nativecast(
            :(HmdColor_t),
            $!SetSceneColor
          )($c)
        }

        method GetBoundsColor (HmdColor_t $oca, int $noc is rw, num32 $cbfd, HmdColor_t $occ) {
          nativecast(
            :(HmdColor_t, int is rw, num32, HmdColor_t),
            $!GetBoundsColor
          )($oca, $noc, $cbfd, $occ)
        }

        method AreBoundsVisible {
          nativecast(
            :( --> bool),
            $!AreBoundsVisible
          )()
        }

        method ForceBoundsVisible (bool $f is rw) {
          nativecast(
            :(bool is rw),
            $!ForceBoundsVisible
          )($f)
        }

}

class VR_IVRResources_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!LoadSharedResource;  #= uint32_t (char * pchResourceName, char * pchBuffer, uint32_t unBufferLen);
        has Pointer $!GetResourceFullPath; #= uint32_t (char * pchResourceName, char * pchResourceTypeDirectory, char * pchPathBuffer, uint32_t unBufferLen);

        method LoadSharedResource (Str $rn, Str $b, uint32 $bl) {
          nativecast(
            :(Str, Str, uint32 --> uint32),
            $!LoadSharedResource
          )($rn, $b, $bl)
        }

        method GetResourceFullPath (Str $rn, Str $rtd, Str $pb, uint32 $bl) {
          nativecast(
            :(Str, Str, Str, uint32 --> uint32),
            $!GetResourceFullPath
          )($rn, $rtd, $pb, $bl)
        }
}


class VR_IVRDriverManager_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!GetDriverCount;  #= uint32_t ();
        has Pointer $!GetDriverName;   #= uint32_t (DriverId_t nDriver, char * pchValue, uint32_t unBufferSize);
        has Pointer $!GetDriverHandle; #= DriverHandle_t (char * pchDriverName);
        has Pointer $!IsEnabled;       #= bool (DriverId_t nDriver);

        method GetDriverCount () {
          nativecast(
            :( --> uint32),
            $!GetDriverCount
          )()
        }

        method GetDriverName (DriverId_t $d is rw, Str $v, uint32 $bs) {
          nativecast(
            :(DriverId_t is rw, Str, uint32 --> uint32),
            $!GetDriverName
          )($d, $v, $bs)
        }

        method GetDriverHandle (Str $dn) {
          nativecast(
            :(Str --> DriverHandle_t),
            $!GetDriverHandle
          )($dn)
        }

        method IsEnabled (DriverId_t $d is rw) {
          nativecast(
            :(DriverId_t is rw --> bool),
            $!IsEnabled
          )($d)
        }

}

class VR_IVRInput_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!SetActionManifestPath;          #= EVRInputError (char * pchActionManifestPath);
        has Pointer $!GetActionSetHandle;             #= EVRInputError (char * pchActionSetName, VRActionSetHandle_t * pHandle);
        has Pointer $!GetActionHandle;                #= EVRInputError (char * pchActionName, VRActionHandle_t * pHandle);
        has Pointer $!GetInputSourceHandle;           #= EVRInputError (char * pchInputSourcePath, VRInputValueHandle_t * pHandle);
        has Pointer $!UpdateActionState;              #= EVRInputError (struct VRActiveActionSet_t * pSets, uint32_t unSizeOfVRSelectedActionSet_t, uint32_t unSetCount);
        has Pointer $!GetDigitalActionData;           #= EVRInputError (VRActionHandle_t action, struct InputDigitalActionData_t * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice);
        has Pointer $!GetAnalogActionData;            #= EVRInputError (VRActionHandle_t action, struct InputAnalogActionData_t * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice);
        has Pointer $!GetPoseActionDataRelativeToNow; #= EVRInputError (VRActionHandle_t action, ETrackingUniverseOrigin eOrigin, float fPredictedSecondsFromNow, struct InputPoseActionData_t * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice);
        has Pointer $!GetPoseActionDataForNextFrame;  #= EVRInputError (VRActionHandle_t action, ETrackingUniverseOrigin eOrigin, struct InputPoseActionData_t * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice);
        has Pointer $!GetSkeletalActionData;          #= EVRInputError (VRActionHandle_t action, struct InputSkeletalActionData_t * pActionData, uint32_t unActionDataSize);
        has Pointer $!GetBoneCount;                   #= EVRInputError (VRActionHandle_t action, uint32_t * pBoneCount);
        has Pointer $!GetBoneHierarchy;               #= EVRInputError (VRActionHandle_t action, BoneIndex_t * pParentIndices, uint32_t unIndexArayCount);
        has Pointer $!GetBoneName;                    #= EVRInputError (VRActionHandle_t action, BoneIndex_t nBoneIndex, char * pchBoneName, uint32_t unNameBufferSize);
        has Pointer $!GetSkeletalReferenceTransforms; #= EVRInputError (VRActionHandle_t action, EVRSkeletalTransformSpace eTransformSpace, EVRSkeletalReferencePose eReferencePose, struct VRBoneTransform_t * pTransformArray, uint32_t unTransformArrayCount);
        has Pointer $!GetSkeletalTrackingLevel;       #= EVRInputError (VRActionHandle_t action, EVRSkeletalTrackingLevel * pSkeletalTrackingLevel);
        has Pointer $!GetSkeletalBoneData;            #= EVRInputError (VRActionHandle_t action, EVRSkeletalTransformSpace eTransformSpace, EVRSkeletalMotionRange eMotionRange, struct VRBoneTransform_t * pTransformArray, uint32_t unTransformArrayCount);
        has Pointer $!GetSkeletalSummaryData;         #= EVRInputError (VRActionHandle_t action, EVRSummaryType eSummaryType, struct VRSkeletalSummaryData_t * pSkeletalSummaryData);
        has Pointer $!GetSkeletalBoneDataCompressed;  #= EVRInputError (VRActionHandle_t action, EVRSkeletalMotionRange eMotionRange, void * pvCompressedData, uint32_t unCompressedSize, uint32_t * punRequiredCompressedSize);
        has Pointer $!DecompressSkeletalBoneData;     #= EVRInputError (void * pvCompressedBuffer, uint32_t unCompressedBufferSize, EVRSkeletalTransformSpace eTransformSpace, struct VRBoneTransform_t * pTransformArray, uint32_t unTransformArrayCount);
        has Pointer $!TriggerHapticVibrationAction;   #= EVRInputError (VRActionHandle_t action, float fStartSecondsFromNow, float fDurationSeconds, float fFrequency, float fAmplitude, VRInputValueHandle_t ulRestrictToDevice);
        has Pointer $!GetActionOrigins;               #= EVRInputError (VRActionSetHandle_t actionSetHandle, VRActionHandle_t digitalActionHandle, VRInputValueHandle_t * originsOut, uint32_t originOutCount);
        has Pointer $!GetOriginLocalizedName;         #= EVRInputError (VRInputValueHandle_t origin, char * pchNameArray, uint32_t unNameArraySize, int32_t unStringSectionsToInclude);
        has Pointer $!GetOriginTrackedDeviceInfo;     #= EVRInputError (VRInputValueHandle_t origin, struct InputOriginInfo_t * pOriginInfo, uint32_t unOriginInfoSize);
        has Pointer $!GetActionBindingInfo;           #= EVRInputError (VRActionHandle_t action, struct InputBindingInfo_t * pOriginInfo, uint32_t unBindingInfoSize, uint32_t unBindingInfoCount, uint32_t * punReturnedBindingInfoCount);
        has Pointer $!ShowActionOrigins;              #= EVRInputError (VRActionSetHandle_t actionSetHandle, VRActionHandle_t ulActionHandle);
        has Pointer $!ShowBindingsForActionSet;       #= EVRInputError (struct VRActiveActionSet_t * pSets, uint32_t unSizeOfVRSelectedActionSet_t, uint32_t unSetCount, VRInputValueHandle_t originToHighlight);
        has Pointer $!IsUsingLegacyInput;             #= bool ();
        has Pointer $!OpenBindingUI;                  #= EVRInputError (char * pchAppKey, VRActionSetHandle_t ulActionSetHandle, VRInputValueHandle_t ulDeviceHandle, bool bShowOnDesktop);

        method SetActionManifestPath (Str $amp) {
          EVRInputErrorEnum(
            nativecast(
              :(Str --> EVRInputError),
              $!SetActionManifestPath
            )($amp)
          );
        }

        method GetActionSetHandle (Str $asn, VRActionSetHandle_t $h is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(Str, VRActionSetHandle_t is rw --> EVRInputError),
              $!GetActionSetHandle
            )($asn, $h)
          );
        }

        method GetActionHandle (Str $an, VRActionHandle_t $h is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(Str, VRActionHandle_t is rw --> EVRInputError),
              $!GetActionHandle
            )($an, $h)
          );
        }

        method GetInputSourceHandle (Str $isp, VRInputValueHandle_t $h is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(Str, VRInputValueHandle_t is rw --> EVRInputError),
              $!GetInputSourceHandle
            )($isp, $h)
          );
        }

        method UpdateActionState (VRActiveActionSet_t $s, uint32 $sosas, uint32 $sc) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActiveActionSet_t, uint32, uint32 --> EVRInputError),
              $!UpdateActionState
            )($s, $sosas, $sc)
          );
        }

        method GetDigitalActionData (VRActionHandle_t $a is rw, InputDigitalActionData_t $ad, uint32 $ads, VRInputValueHandle_t $rtd is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, InputDigitalActionData_t, uint32, VRInputValueHandle_t is rw --> EVRInputError),
              $!GetDigitalActionData
            )($a, $ad, $ads, $rtd)
          );
        }

        method GetAnalogActionData (VRActionHandle_t $a is rw, InputAnalogActionData_t $ad, uint32 $ads, VRInputValueHandle_t $rtd is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, InputAnalogActionData_t, uint32, VRInputValueHandle_t is rw --> EVRInputError),
              $!GetAnalogActionData
            )($a, $ad, $ads, $rtd)
          );
        }

        method GetPoseActionDataRelativeToNow (VRActionHandle_t $a is rw, ETrackingUniverseOrigin $o is rw, num32 $psfn, InputPoseActionData_t $ad, uint32 $ads, VRInputValueHandle_t $rtd is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, ETrackingUniverseOrigin is rw, num32, InputPoseActionData_t, uint32, VRInputValueHandle_t is rw --> EVRInputError),
              $!GetPoseActionDataRelativeToNow
            )($a, $o, $psfn, $ad, $ads, $rtd)
          );
        }

        method GetPoseActionDataForNextFrame (VRActionHandle_t $a is rw, ETrackingUniverseOrigin $o is rw, InputPoseActionData_t $ad, uint32 $ads, VRInputValueHandle_t $rtd is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, ETrackingUniverseOrigin is rw, InputPoseActionData_t, uint32, VRInputValueHandle_t is rw --> EVRInputError),
              $!GetPoseActionDataForNextFrame
            )($a, $o, $ad, $ads, $rtd)
          );
        }

        method GetSkeletalActionData (VRActionHandle_t $a is rw, InputSkeletalActionData_t $ad, uint32 $ads) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, InputSkeletalActionData_t, uint32 --> EVRInputError),
              $!GetSkeletalActionData
            )($a, $ad, $ads)
          );
        }

        method GetBoneCount (VRActionHandle_t $a is rw, uint32 $bc is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, uint32 is rw --> EVRInputError),
              $!GetBoneCount
            )($a, $bc)
          );
        }

        method GetBoneHierarchy (VRActionHandle_t $a is rw, BoneIndex_t $pi is rw, uint32 $iac) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, BoneIndex_t is rw, uint32 --> EVRInputError),
              $!GetBoneHierarchy
            )($a, $pi, $iac)
          );
        }

        method GetBoneName (VRActionHandle_t $a is rw, BoneIndex_t $bi is rw, Str $bn, uint32 $nbs) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, BoneIndex_t is rw, Str, uint32 --> EVRInputError),
              $!GetBoneName
            )($a, $bi, $bn, $nbs)
          );
        }

        method GetSkeletalReferenceTransforms (VRActionHandle_t $a is rw, EVRSkeletalTransformSpace $ts is rw, EVRSkeletalReferencePose $rp is rw, VRBoneTransform_t $ta, uint32 $tac) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, EVRSkeletalTransformSpace is rw, EVRSkeletalReferencePose is rw, VRBoneTransform_t, uint32 --> EVRInputError),
              $!GetSkeletalReferenceTransforms
            )($a, $ts, $rp, $ta, $tac)
          );
        }

        method GetSkeletalTrackingLevel (VRActionHandle_t $a is rw, EVRSkeletalTrackingLevel $stl is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, EVRSkeletalTrackingLevel is rw --> EVRInputError),
              $!GetSkeletalTrackingLevel
            )($a, $stl)
          );
        }

        method GetSkeletalBoneData (VRActionHandle_t $a is rw, EVRSkeletalTransformSpace $ts is rw, EVRSkeletalMotionRange $mr is rw, VRBoneTransform_t $ta, uint32 $tac) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, EVRSkeletalTransformSpace is rw, EVRSkeletalMotionRange is rw, VRBoneTransform_t, uint32 --> EVRInputError),
              $!GetSkeletalBoneData
            )($a, $ts, $mr, $ta, $tac)
          );
        }

        method GetSkeletalSummaryData (VRActionHandle_t $a is rw, EVRSummaryType $st is rw, VRSkeletalSummaryData_t $ssd) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, EVRSummaryType is rw, VRSkeletalSummaryData_t --> EVRInputError),
              $!GetSkeletalSummaryData
            )($a, $st, $ssd)
          );
        }

        method GetSkeletalBoneDataCompressed (VRActionHandle_t $a is rw, EVRSkeletalMotionRange $mr is rw, void $cd is rw, uint32 $cs, uint32 $rcs is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, EVRSkeletalMotionRange is rw, void is rw, uint32, uint32 is rw --> EVRInputError),
              $!GetSkeletalBoneDataCompressed
            )($a, $mr, $cd, $cs, $rcs)
          );
        }

        method DecompressSkeletalBoneData (void $cb is rw, uint32 $cbs, EVRSkeletalTransformSpace $ts is rw, VRBoneTransform_t $ta, uint32 $tac) {
          EVRInputErrorEnum(
            nativecast(
              :(void is rw, uint32, EVRSkeletalTransformSpace is rw, VRBoneTransform_t, uint32 --> EVRInputError),
              $!DecompressSkeletalBoneData
            )($cb, $cbs, $ts, $ta, $tac)
          );
        }

        method TriggerHapticVibrationAction (VRActionHandle_t $a is rw, num32 $ssfn, num32 $ds, num32 $f, num32 $a2, VRInputValueHandle_t $rtd is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, num32, num32, num32, num32, VRInputValueHandle_t is rw --> EVRInputError),
              $!TriggerHapticVibrationAction
            )($a, $ssfn, $ds, $f, $a2, $rtd)
          );
        }

        method GetActionOrigins (VRActionSetHandle_t $sh is rw, VRActionHandle_t $ah is rw, VRInputValueHandle_t $o is rw, uint32 $oc) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionSetHandle_t is rw, VRActionHandle_t is rw, VRInputValueHandle_t is rw, uint32 --> EVRInputError),
              $!GetActionOrigins
            )($sh, $ah, $o, $oc)
          );
        }

        method GetOriginLocalizedName (VRInputValueHandle_t $o is rw, Str $na, uint32 $nas, int32 $ssti) {
          EVRInputErrorEnum(
            nativecast(
              :(VRInputValueHandle_t is rw, Str, uint32, int32 --> EVRInputError),
              $!GetOriginLocalizedName
            )($o, $na, $nas, $ssti)
          );
        }

        method GetOriginTrackedDeviceInfo (VRInputValueHandle_t $o is rw, InputOriginInfo_t $oi, uint32 $ois) {
          EVRInputErrorEnum(
            nativecast(
              :(VRInputValueHandle_t is rw, InputOriginInfo_t, uint32 --> EVRInputError),
              $!GetOriginTrackedDeviceInfo
            )($o, $oi, $ois)
          );
        }

        method GetActionBindingInfo (VRActionHandle_t $a is rw, InputBindingInfo_t $oi, uint32 $bis, uint32 $bic, uint32 $rbic is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionHandle_t is rw, InputBindingInfo_t, uint32, uint32, uint32 is rw --> EVRInputError),
              $!GetActionBindingInfo
            )($a, $oi, $bis, $bic, $rbic)
          );
        }

        method ShowActionOrigins (VRActionSetHandle_t $sh is rw, VRActionHandle_t $ah is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActionSetHandle_t is rw, VRActionHandle_t is rw --> EVRInputError),
              $!ShowActionOrigins
            )($sh, $ah)
          );
        }

        method ShowBindingsForActionSet (VRActiveActionSet_t $s, uint32 $sosas, uint32 $sc, VRInputValueHandle_t $th is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(VRActiveActionSet_t, uint32, uint32, VRInputValueHandle_t is rw --> EVRInputError),
              $!ShowBindingsForActionSet
            )($s, $sosas, $sc, $th)
          );
        }

        method IsUsingLegacyInput () {
          nativecast(
            :( --> bool),
            $!IsUsingLegacyInput
          )()
        }

        method OpenBindingUI (Str $ak, VRActionSetHandle_t $ash is rw, VRInputValueHandle_t $dh is rw, bool $sod is rw) {
          EVRInputErrorEnum(
            nativecast(
              :(Str, VRActionSetHandle_t is rw, VRInputValueHandle_t is rw, bool is rw --> EVRInputError),
              $!OpenBindingUI
            )($ak, $ash, $dh, $sod)
          );
        }
}

class VR_IVRIOBuffer_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!Open;              #= EIOBufferError (char * pchPath, EIOBufferMode mode, uint32_t unElementSize, uint32_t unElements, IOBufferHandle_t * pulBuffer);
        has Pointer $!Close;             #= EIOBufferError (IOBufferHandle_t ulBuffer);
        has Pointer $!Read;              #= EIOBufferError (IOBufferHandle_t ulBuffer, void * pDst, uint32_t unBytes, uint32_t * punRead);
        has Pointer $!Write;             #= EIOBufferError (IOBufferHandle_t ulBuffer, void * pSrc, uint32_t unBytes);
        has Pointer $!PropertyContainer; #= PropertyContainerHandle_t (IOBufferHandle_t ulBuffer);
        has Pointer $!HasReaders;        #= bool (IOBufferHandle_t ulBuffer);

        method Open (Str $p, EIOBufferMode $m is rw, uint32 $es, uint32 $e, IOBufferHandle_t $b is rw) {
          EIOBufferErrorEnum(
            nativecast(
              :(Str, EIOBufferMode is rw, uint32, uint32, IOBufferHandle_t is rw --> EIOBufferError),
              $!Open
            )($p, $m, $es, $e, $b)
          );
        }

        method Close (IOBufferHandle_t $b is rw) {
          EIOBufferErrorEnum(
            nativecast(
              :(IOBufferHandle_t is rw --> EIOBufferError),
              $!Close
            )($b)
          );
        }

        method Read (IOBufferHandle_t $b is rw, void $d is rw, uint32 $b2, uint32 $r is rw) {
          EIOBufferErrorEnum(
            nativecast(
              :(IOBufferHandle_t is rw, void is rw, uint32, uint32 is rw --> EIOBufferError),
              $!Read
            )($b, $d, $b2, $r)
          );
        }

        method Write (IOBufferHandle_t $b is rw, void $s is rw, uint32 $b2) {
          EIOBufferErrorEnum(
            nativecast(
              :(IOBufferHandle_t is rw, void is rw, uint32 --> EIOBufferError),
              $!Write
            )($b, $s, $b2)
          );
        }

        method PropertyContainer (IOBufferHandle_t $b is rw) {
          nativecast(
            :(IOBufferHandle_t is rw --> PropertyContainerHandle_t),
            $!PropertyContainer
          )($b)
        }

        method HasReaders (IOBufferHandle_t $b is rw) {
          nativecast(
            :(IOBufferHandle_t is rw --> bool),
            $!HasReaders
          )($b)
        }

}

class VR_IVRSpatialAnchors_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!CreateSpatialAnchorFromDescriptor; #= EVRSpatialAnchorError (char * pchDescriptor, SpatialAnchorHandle_t * pHandleOut);
        has Pointer $!CreateSpatialAnchorFromPose;       #= EVRSpatialAnchorError (TrackedDeviceIndex_t unDeviceIndex, ETrackingUniverseOrigin eOrigin, struct SpatialAnchorPose_t * pPose, SpatialAnchorHandle_t * pHandleOut);
        has Pointer $!GetSpatialAnchorPose;              #= EVRSpatialAnchorError (SpatialAnchorHandle_t unHandle, ETrackingUniverseOrigin eOrigin, struct SpatialAnchorPose_t * pPoseOut);
        has Pointer $!GetSpatialAnchorDescriptor;        #= EVRSpatialAnchorError (SpatialAnchorHandle_t unHandle, char * pchDescriptorOut, uint32_t * punDescriptorBufferLenInOut);

        method CreateSpatialAnchorFromDescriptor (Str $d, SpatialAnchorHandle_t $ho is rw) {
          EVRSpatialAnchorErrorEnum(
            nativecast(
              :(Str, SpatialAnchorHandle_t is rw --> EVRSpatialAnchorError),
              $!CreateSpatialAnchorFromDescriptor
            )($d, $ho)
          );
        }

        method CreateSpatialAnchorFromPose (TrackedDeviceIndex_t $di is rw, ETrackingUniverseOrigin $o is rw, SpatialAnchorPose_t $p, SpatialAnchorHandle_t $ho is rw) {
          EVRSpatialAnchorErrorEnum(
            nativecast(
              :(TrackedDeviceIndex_t is rw, ETrackingUniverseOrigin is rw, SpatialAnchorPose_t, SpatialAnchorHandle_t is rw --> EVRSpatialAnchorError),
              $!CreateSpatialAnchorFromPose
            )($di, $o, $p, $ho)
          );
        }

        method GetSpatialAnchorPose (SpatialAnchorHandle_t $h is rw, ETrackingUniverseOrigin $o is rw, SpatialAnchorPose_t $po) {
          EVRSpatialAnchorErrorEnum(
            nativecast(
              :(SpatialAnchorHandle_t is rw, ETrackingUniverseOrigin is rw, SpatialAnchorPose_t --> EVRSpatialAnchorError),
              $!GetSpatialAnchorPose
            )($h, $o, $po)
          );
        }

        method GetSpatialAnchorDescriptor (SpatialAnchorHandle_t $h is rw, Str $do, uint32 $dblio is rw) {
          EVRSpatialAnchorErrorEnum(
            nativecast(
              :(SpatialAnchorHandle_t is rw, Str, uint32 is rw --> EVRSpatialAnchorError),
              $!GetSpatialAnchorDescriptor
            )($h, $do, $dblio)
          );
        }

}

class VR_IVRDebug_FnTable is repr<CStruct> is export does OpenVRInterface {
        has Pointer $!EmitVrProfilerEvent;   #= EVRDebugError (char * pchMessage);
        has Pointer $!BeginVrProfilerEvent;  #= EVRDebugError (VrProfilerEventHandle_t * pHandleOut);
        has Pointer $!FinishVrProfilerEvent; #= EVRDebugError (VrProfilerEventHandle_t hHandle, char * pchMessage);
        has Pointer $!DriverDebugRequest;    #= uint32_t (TrackedDeviceIndex_t unDeviceIndex, char * pchRequest, char * pchResponseBuffer, uint32_t unResponseBufferSize);

        method EmitVrProfilerEvent (Str $m) {
          EVRDebugErrorEnum(
            nativecast(
              :(Str --> EVRDebugError),
              $!EmitVrProfilerEvent
            )($m)
          );
        }

        method BeginVrProfilerEvent (VrProfilerEventHandle_t $ho is rw) {
          EVRDebugErrorEnum(
            nativecast(
              :(VrProfilerEventHandle_t is rw --> EVRDebugError),
              $!BeginVrProfilerEvent
            )($ho)
          );
        }

        method FinishVrProfilerEvent (VrProfilerEventHandle_t $h is rw, Str $m) {
          EVRDebugErrorEnum(
            nativecast(
              :(VrProfilerEventHandle_t is rw, Str --> EVRDebugError),
              $!FinishVrProfilerEvent
            )($h, $m)
          );
        }

        method DriverDebugRequest (TrackedDeviceIndex_t $di is rw, Str $r, Str $rb, uint32 $rbs) {
          nativecast(
            :(TrackedDeviceIndex_t is rw, Str, Str, uint32 --> uint32),
            $!DriverDebugRequest
          )($di, $r, $rb, $rbs)
        }

}
