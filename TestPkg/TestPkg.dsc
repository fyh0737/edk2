## @file
# EFI/Framework Emulation Platform with UEFI HII interface supported.
# NT32 is used for structure PCD test and verification.
#
# Copyright (c) 2006 - 2017, Intel Corporation. All rights reserved.<BR>
# Copyright (c) 2015, Hewlett-Packard Development Company, L.P.<BR>
# (C) Copyright 2016 Hewlett Packard Enterprise Development LP<BR>
#
#    This program and the accompanying materials
#    are licensed and made available under the terms and conditions of the BSD License
#    which accompanies this distribution. The full text of the license may be found at
#    http://opensource.org/licenses/bsd-license.php
#
#    THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#    WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = NT32
  PLATFORM_GUID                  = EB216561-961F-47EE-9EF9-CA426EF547C2
  PLATFORM_VERSION               = 0.4
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/TestIa32
  SUPPORTED_ARCHITECTURES        = IA32|X64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = ALL
  FLASH_DEFINITION               = TestPkg/TestPkg.fdf
  VPD_TOOL_GUID                  = 8C3D856A-9BE6-468E-850A-24F7A8D38E08
  #
  # This flag is to control tool to generate PCD info for dynamic(ex) PCD,
  # then enable or disable PCD info feature. TRUE is enable, and FLASE is disable.
  # If the flag is absent, it will be same as FALSE.
  #
  PCD_INFO_GENERATION            = TRUE

  #
  # Defines for default states.  These can be changed on the command line.
  # -D FLAG=VALUE
  #
  # Note: Secure Boot feature highly depends on the OpenSSL building. To enable this
  #       feature, please follow the instructions found in the file "Patch-HOWTO.txt"
  #       located in CryptoPkg\Library\OpensslLib to enable the OpenSSL building first.
  #
  DEFINE SECURE_BOOT_ENABLE      = FALSE

  #
  # This flag is to enable or disable TLS feature.
  # These can be changed on the command line.
  # -D FLAG=VALUE
  #
  # Note: TLS feature highly depends on the OpenSSL building. To enable this
  #       feature, please follow the instructions found in the file "Patch-HOWTO.txt"
  #       located in CryptoPkg\Library\OpensslLib to enable the OpenSSL building first.
  #
  DEFINE TLS_ENABLE = FALSE

  #
  # Indicates whether HTTP connections (i.e., unsecured) are permitted or not.
  # -D FLAG=VALUE
  #
  # Note: If ALLOW_HTTP_CONNECTIONS is TRUE, HTTP connections are allowed. Both
  #       the "https://" and "http://" URI schemes are permitted. Otherwise, HTTP
  #       connections are denied. Only the "https://" URI scheme is permitted.
  #
  DEFINE ALLOW_HTTP_CONNECTIONS = TRUE

  #
  # This flag is to enable or disable IPv6 network stack.
  # These can be changed on the command line.
  # -D FLAG=VALUE
  #
  DEFINE NETWORK_IP6_ENABLE = FALSE

################################################################################
#
# SKU Identification section - list of all SKU IDs supported by this
#                              Platform.
#
################################################################################
[SkuIds]
  0|DEFAULT              # The entry: 0|DEFAULT is reserved and always required.
  1|SKU1

[DefaultStores]
  0|STANDARD             # UEFI Standard default  0|STANDARD is reserved.
  1|MANUFACTURING        # UEFI Manufacturing default 1|MANUFACTURING is reserved.

################################################################################
#
# Library Class section - list of all Library Classes needed by this Platform.
#
################################################################################
[LibraryClasses]
  #
  # Entry point
  #
  PeiCoreEntryPoint|MdePkg/Library/PeiCoreEntryPoint/PeiCoreEntryPoint.inf
  PeimEntryPoint|MdePkg/Library/PeimEntryPoint/PeimEntryPoint.inf
  DxeCoreEntryPoint|MdePkg/Library/DxeCoreEntryPoint/DxeCoreEntryPoint.inf
  UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  #
  # Basic
  #
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  SynchronizationLib|MdePkg/Library/BaseSynchronizationLib/BaseSynchronizationLib.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  CpuLib|MdePkg/Library/BaseCpuLib/BaseCpuLib.inf
  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  PciLib|MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  PciCf8Lib|MdePkg/Library/BasePciCf8Lib/BasePciCf8Lib.inf
  PciExpressLib|MdePkg/Library/BasePciExpressLib/BasePciExpressLib.inf
  CacheMaintenanceLib|MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf
  PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf
  #
  # UEFI & PI
  #
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  UefiRuntimeLib|MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  UefiHiiServicesLib|MdeModulePkg/Library/UefiHiiServicesLib/UefiHiiServicesLib.inf
  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLibDevicePathProtocol/UefiDevicePathLibDevicePathProtocol.inf
  UefiDecompressLib|IntelFrameworkModulePkg/Library/BaseUefiTianoCustomDecompressLib/BaseUefiTianoCustomDecompressLib.inf
  PeiServicesTablePointerLib|MdePkg/Library/PeiServicesTablePointerLib/PeiServicesTablePointerLib.inf
  PeiServicesLib|MdePkg/Library/PeiServicesLib/PeiServicesLib.inf
  DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf
  DxeServicesTableLib|MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  UefiBootManagerLib|MdeModulePkg/Library/UefiBootManagerLib/UefiBootManagerLib.inf
  FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.inf

  #
  # Generic Modules
  #
  UefiUsbLib|MdePkg/Library/UefiUsbLib/UefiUsbLib.inf
  UefiScsiLib|MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  NetLib|MdeModulePkg/Library/DxeNetLib/DxeNetLib.inf
  IpIoLib|MdeModulePkg/Library/DxeIpIoLib/DxeIpIoLib.inf
  UdpIoLib|MdeModulePkg/Library/DxeUdpIoLib/DxeUdpIoLib.inf
  TcpIoLib|MdeModulePkg/Library/DxeTcpIoLib/DxeTcpIoLib.inf
  HttpLib|MdeModulePkg/Library/DxeHttpLib/DxeHttpLib.inf
  DpcLib|MdeModulePkg/Library/DxeDpcLib/DxeDpcLib.inf
  OemHookStatusCodeLib|MdeModulePkg/Library/OemHookStatusCodeLibNull/OemHookStatusCodeLibNull.inf
  GenericBdsLib|IntelFrameworkModulePkg/Library/GenericBdsLib/GenericBdsLib.inf
  CustomizedDisplayLib|MdeModulePkg/Library/CustomizedDisplayLib/CustomizedDisplayLib.inf
  SecurityManagementLib|MdeModulePkg/Library/DxeSecurityManagementLib/DxeSecurityManagementLib.inf
  TimerLib|MdePkg/Library/BaseTimerLibNullTemplate/BaseTimerLibNullTemplate.inf
  SerialPortLib|MdePkg/Library/BaseSerialPortLibNull/BaseSerialPortLibNull.inf
  CapsuleLib|MdeModulePkg/Library/DxeCapsuleLibNull/DxeCapsuleLibNull.inf
  BootLogoLib|MdeModulePkg/Library/BootLogoLib/BootLogoLib.inf
  #
  # Platform
  #
  PlatformBootManagerLib|Nt32Pkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf
  #
  # Misc
  #
  DebugLib|MdeModulePkg/Library/PeiDxeDebugLibReportStatusCode/PeiDxeDebugLibReportStatusCode.inf
  DebugPrintErrorLevelLib|MdeModulePkg/Library/DxeDebugPrintErrorLevelLib/DxeDebugPrintErrorLevelLib.inf
  PerformanceLib|MdePkg/Library/BasePerformanceLibNull/BasePerformanceLibNull.inf
  DebugAgentLib|MdeModulePkg/Library/DebugAgentLibNull/DebugAgentLibNull.inf
  CpuExceptionHandlerLib|MdeModulePkg/Library/CpuExceptionHandlerLibNull/CpuExceptionHandlerLibNull.inf
  LockBoxLib|MdeModulePkg/Library/LockBoxNullLib/LockBoxNullLib.inf
  IntrinsicLib|CryptoPkg/Library/IntrinsicLib/IntrinsicLib.inf
  ResetSystemLib|Nt32Pkg/Library/ResetSystemLib/ResetSystemLib.inf
!if $(TLS_ENABLE) == TRUE
  OpensslLib|CryptoPkg/Library/OpensslLib/OpensslLib.inf
!else
  OpensslLib|CryptoPkg/Library/OpensslLib/OpensslLibCrypto.inf
!endif

!if $(SECURE_BOOT_ENABLE) == TRUE
  PlatformSecureLib|Nt32Pkg/Library/PlatformSecureLib/PlatformSecureLib.inf
  TpmMeasurementLib|SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.inf
  AuthVariableLib|SecurityPkg/Library/AuthVariableLib/AuthVariableLib.inf
!else
  TpmMeasurementLib|MdeModulePkg/Library/TpmMeasurementLibNull/TpmMeasurementLibNull.inf
  AuthVariableLib|MdeModulePkg/Library/AuthVariableLibNull/AuthVariableLibNull.inf
!endif
  VarCheckLib|MdeModulePkg/Library/VarCheckLib/VarCheckLib.inf

[LibraryClasses.common.USER_DEFINED]
  DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  PeCoffExtraActionLib|MdePkg/Library/BasePeCoffExtraActionLibNull/BasePeCoffExtraActionLibNull.inf
  ReportStatusCodeLib|MdeModulePkg/Library/PeiReportStatusCodeLib/PeiReportStatusCodeLib.inf
  OemHookStatusCodeLib|Nt32Pkg/Library/PeiNt32OemHookStatusCodeLib/PeiNt32OemHookStatusCodeLib.inf
  MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf

[LibraryClasses.common.PEIM,LibraryClasses.common.PEI_CORE]
  #
  # PEI phase common
  #
  HobLib|MdePkg/Library/PeiHobLib/PeiHobLib.inf
  MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  ReportStatusCodeLib|MdeModulePkg/Library/PeiReportStatusCodeLib/PeiReportStatusCodeLib.inf
  ExtractGuidedSectionLib|MdePkg/Library/PeiExtractGuidedSectionLib/PeiExtractGuidedSectionLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLibOptPei/BaseMemoryLibOptPei.inf
  IoLib|MdePkg/Library/PeiIoLibCpuIo/PeiIoLibCpuIo.inf
  PeCoffGetEntryPointLib|Nt32Pkg/Library/Nt32PeiPeCoffGetEntryPointLib/Nt32PeiPeCoffGetEntryPointLib.inf
  PeCoffExtraActionLib|Nt32Pkg/Library/PeiNt32PeCoffExtraActionLib/PeiNt32PeCoffExtraActionLib.inf
  DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf

[LibraryClasses.common.PEI_CORE]
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  OemHookStatusCodeLib|MdeModulePkg/Library/OemHookStatusCodeLibNull/OemHookStatusCodeLibNull.inf

[LibraryClasses.common.PEIM]
  PcdLib|MdePkg/Library/PeiPcdLib/PeiPcdLib.inf
  OemHookStatusCodeLib|Nt32Pkg/Library/PeiNt32OemHookStatusCodeLib/PeiNt32OemHookStatusCodeLib.inf
  BaseCryptLib|CryptoPkg/Library/BaseCryptLib/PeiCryptLib.inf

[LibraryClasses.common]
  #
  # DXE phase common
  #
  BaseMemoryLib|MdePkg/Library/BaseMemoryLibOptDxe/BaseMemoryLibOptDxe.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  ReportStatusCodeLib|MdeModulePkg/Library/DxeReportStatusCodeLib/DxeReportStatusCodeLib.inf
  OemHookStatusCodeLib|Nt32Pkg/Library/DxeNt32OemHookStatusCodeLib/DxeNt32OemHookStatusCodeLib.inf
  PeCoffExtraActionLib|Nt32Pkg/Library/DxeNt32PeCoffExtraActionLib/DxeNt32PeCoffExtraActionLib.inf
  ExtractGuidedSectionLib|MdePkg/Library/DxeExtractGuidedSectionLib/DxeExtractGuidedSectionLib.inf
  WinNtLib|Nt32Pkg/Library/DxeWinNtLib/DxeWinNtLib.inf
  BaseCryptLib|CryptoPkg/Library/BaseCryptLib/BaseCryptLib.inf
  TlsLib|CryptoPkg/Library/TlsLib/TlsLib.inf

[LibraryClasses.common.DXE_CORE]
  HobLib|MdePkg/Library/DxeCoreHobLib/DxeCoreHobLib.inf
  MemoryAllocationLib|MdeModulePkg/Library/DxeCoreMemoryAllocationLib/DxeCoreMemoryAllocationLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf

[LibraryClasses.common.DXE_SMM_DRIVER]
  DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf

[LibraryClasses.common.UEFI_DRIVER]
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf

[LibraryClasses.common.UEFI_APPLICATION]
  PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  PrintLib|MdeModulePkg/Library/DxePrintLibPrint2Protocol/DxePrintLibPrint2Protocol.inf

[LibraryClasses.common.DXE_RUNTIME_DRIVER]
  #
  # Runtime
  #
  BaseCryptLib|CryptoPkg/Library/BaseCryptLib/RuntimeCryptLib.inf

################################################################################
#
# Pcd Section - list of all EDK II PCD Entries defined by this Platform
#
################################################################################
[PcdsFeatureFlag]
  gEfiMdeModulePkgTokenSpaceGuid.PcdStatusCodeUseSerial|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdDxeIplSwitchToLongMode|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdDxeIplBuildPageTables|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdPeiCoreImageLoaderSearchTeSectionFirst|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdVariableCollectStatistics|TRUE

[PcdsFixedAtBuild]
  gEfiMdeModulePkgTokenSpaceGuid.PcdImageProtectionPolicy|0x00000000
  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxSizeNonPopulateCapsule|0x0
  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxSizePopulateCapsule|0x0
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000040
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x1f
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtFirmwareVolume|L"..\\Fv\\Nt32.fd"
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtFirmwareBlockSize|0x10000
  gEfiMdePkgTokenSpaceGuid.PcdReportStatusCodePropertyMask|0x0f
  gEfiMdeModulePkgTokenSpaceGuid.PcdResetOnMemoryTypeInformationChange|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxVariableSize|0x2000

!if $(ALLOW_HTTP_CONNECTIONS) == TRUE
  gEfiNetworkPkgTokenSpaceGuid.PcdAllowHttpConnections|TRUE
!endif

!ifndef $(USE_OLD_SHELL)
  gEfiIntelFrameworkModulePkgTokenSpaceGuid.PcdShellFile|{ 0x83, 0xA5, 0x04, 0x7C, 0x3E, 0x9E, 0x1C, 0x4F, 0xAD, 0x65, 0xE0, 0x52, 0x68, 0xD0, 0xB4, 0xD1 }
!endif

!if $(SECURE_BOOT_ENABLE) == TRUE
  # override the default values from SecurityPkg to ensure images from all sources are verified in secure boot
  gEfiSecurityPkgTokenSpaceGuid.PcdOptionRomImageVerificationPolicy|0x04
  gEfiSecurityPkgTokenSpaceGuid.PcdFixedMediaImageVerificationPolicy|0x04
  gEfiSecurityPkgTokenSpaceGuid.PcdRemovableMediaImageVerificationPolicy|0x04
!endif

  gEfiMdeModulePkgTokenSpaceGuid.PcdBootManagerMenuFile|{ 0x21, 0xaa, 0x2c, 0x46, 0x14, 0x76, 0x03, 0x45, 0x83, 0x6e, 0x8a, 0xb6, 0xf4, 0x66, 0x23, 0x31 }


################################################################################
#
# Pcd Dynamic Section - list of all EDK II PCD Entries defined by this Platform
#
################################################################################
[PcdsDynamicDefault.common.DEFAULT]
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtSerialPort|L"COM1!COM2"|VOID*|20
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtGop|L"UGA Window 1!UGA Window 2"|VOID*|52
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtConsole|L"Bus Driver Console Window"|VOID*|52
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtVirtualDisk|L"FW;40960;512"|VOID*|26
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtMemorySize|L"64!64"|VOID*|12
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtPhysicalDisk|L"a:RW;2880;512!d:RO;307200;2048!j:RW;262144;512"|VOID*|100
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtUga|L"UGA Window 1!UGA Window 2"|VOID*|52

  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase64|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase64|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase64|0

[PcdsDynamicDefault.Ia32]
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtFileSystem|L"."|VOID*|106

[PcdsDynamicDefault.x64]
  gEfiNt32PkgTokenSpaceGuid.PcdWinNtFileSystem|L"."|VOID*|106

[PcdsDynamicHii.common.DEFAULT]
  gEfiMdePkgTokenSpaceGuid.PcdPlatformBootTimeOut|L"Timeout"|gEfiGlobalVariableGuid|0x0|10
  gEfiMdePkgTokenSpaceGuid.PcdHardwareErrorRecordLevel|L"HwErrRecSupport"|gEfiGlobalVariableGuid|0x0|1

gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData|L"MyIfrNVData"|gDriverSampleFormSetGuid|0x00|{0x0}|NV, BS
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.ConOutColumn|80
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.ConOutRow|25
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.SuppressGrayOutSomething|0x2
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.BootOrderLarge|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.ChooseToActivateNuclearWeaponry|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.BootOrder|{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.OrderedList|{0x01,0x02,0x03,0x00,0x00,0x00,0x00,0x00}
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.TestLateCheck|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.TestLateCheck2|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.QuestionAboutTreeHugging|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.HowOldAreYouInYearsManual|0x15
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.HowOldAreYouInYearsManual|0x15
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.HowOldAreYouInYears|0x12
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.GetDefaultValueFromAccess|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.GetDefaultValueFromCallBack|0x12
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.GetDefaultValueFromCallBackForOrderedList|{0x00,0x00,0x00}
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.ChooseToActivateNuclearWeaponry|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.DynamicRefresh|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.Match2|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.SerialPortNo|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.SerialPortStatus|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.SerialPortIo|0x3f8
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.SerialPortIrq|0x4
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.RefreshGuidCount|0x0
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.MyBitData.NestBitCheckbox|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.MyBitData.NestBitOneof|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.MyBitData.NestBitNumeric|0x6
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.MyBitData.NestByteField|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.BitOneof|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.BitCheckbox|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyIfrNVData.BitNumeric|0x10

gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyEfiVar|L"MyEfiVar"|gDriverSampleFormSetGuid|0x00|{0x0}|NV, BS
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyEfiVar.Field8|0x12
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyEfiVar.Field16|0x1
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyEfiVar.SubmittedCallback|0x12

gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyEfiUnionData|L"MyEfiUnionVar"|gDriverSampleFormSetGuid|0x00|{0x0}|NV, BS
gEfiStructuredPcdPkgTokenSpaceGuid.PcdMyEfiUnionData.UnionNumeric|0x8

  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|L"ConOutSetup"|gDriverSampleFormSetGuid|0x0|100|NV, BS
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|L"ConOutSetup"|gDriverSampleFormSetGuid|0x4|31|NV, BS

[PcdsFixedAtBuild]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.C|"a"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.Array2[0]|2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.FlexibleArray[7]|5
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.FlexibleArray[4]|L"C"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.FlexibleArray[3]|"b"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.Array2|{1, 2, 3}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.Array|L"Hello World"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestFix.OneLine64|18446744073709551615

[PcdsPatchableInModule]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestPatchable
  gEfiStructuredPcdPkgTokenSpaceGuid.TestPatchable.A|MacroTestFunc (MacroTest2, 0x2)
  gEfiStructuredPcdPkgTokenSpaceGuid.TestPatchable.C|"b"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestPatchable.Array2[0]|2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestPatchable.Guid|{GUID("6F08F62E-5C19-498E-9157-B59CE6F362F1")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestPatchable.FlexibleArray|L"Patchable"

[PcdsDynamicDefault.common.DEFAULT]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.C|"c"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.Array2[0]|0
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.Guid|{GUID("6F08F62E-5C19-498E-9157-B59CE6F362F1")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.FlexibleArray|{DEVICE_PATH("PciRoot(0x0)/Pci(0x1F, 0x2)/Sata(0x0, 0xFFFF, 0x0)")}

[PcdsDynamicDefault.common.SKU1]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.C|"c"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.Array2[0]|1
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.Guid|{GUID("6F08F62E-5C19-498E-9157-B59CE6F362F1")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamic.FlexibleArray|{DEVICE_PATH("Fv(EB216561-961F-47EE-9EF9-CA426EF547C2)/FvFile(8C3D856A-9BE6-468E-850A-24F7A8D38E08)")}

[PcdsDynamicExHii.common.DEFAULT.STANDARD]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii|L"TestHii"|gTestHiiVarGuid|0x00
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.C|"d"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.Array2[0]|0
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.Guid|{GUID("EB216561-961F-47EE-9EF9-CA426EF547C2")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.FlexibleArray|L"PcdsDynamicExHii"

[PcdsDynamicExHii.common.DEFAULT.MANUFACTURING]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii|L"TestHii"|gTestHiiVarGuid|0x00
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.C|"m"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.Array2[0]|0
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.Guid|{GUID("EB216561-961F-47EE-9EF9-CA426EF547C2")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.FlexibleArray|L"PcdsDynamicExHii"

[PcdsDynamicExHii.common.SKU1]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii|L"TestHii"|gTestHiiVarGuid|0x00
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.C|"d"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.Array2[0]|1
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.Guid|{GUID("EB216561-961F-47EE-9EF9-CA426EF547C2")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicExHii.FlexibleArray|L"PcdsDynamicExHiiSku1"

[PcdsDynamicExVpd.common.DEFAULT]
  gEfiMdeModulePkgTokenSpaceGuid.PcdNvStoreDefaultValueBuffer|*

[PcdsDynamicVpd.common.DEFAULT]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd|*
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.C|"e"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.Array2[0]|0
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.Guid|{GUID("EB216561-961F-47EE-9EF9-CA426EF547C2")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.FlexibleArray|L"PcdsDynamicVpd"

[PcdsDynamicVpd.common.SKU1]
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd|*
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.A|MacroTest2
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.C|"e"
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.Array2[0]|1
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.Guid|{GUID("EB216561-961F-47EE-9EF9-CA426EF547C2")}
  gEfiStructuredPcdPkgTokenSpaceGuid.TestDynamicVpd.FlexibleArray|L"PcdsDynamicVpdSku1"

###################################################################################################
#
# Components Section - list of the modules and components that will be processed by compilation
#                      tools and the EDK II tools to generate PE32/PE32+/Coff image files.
#
# Note: The EDK II DSC file is not used to specify how compiled binary images get placed
#       into firmware volume images. This section is just a list of modules to compile from
#       source into UEFI-compliant binaries.
#       It is the FDF file that contains information on combining binary files into firmware
#       volume images, whose concept is beyond UEFI and is described in PI specification.
#       Binary modules do not need to be listed in this section, as they should be
#       specified in the FDF file. For example: Shell binary (Shell_Full.efi), FAT binary (Fat.efi),
#       Logo (Logo.bmp), and etc.
#       There may also be modules listed in this section that are not required in the FDF file,
#       When a module listed here is excluded from FDF file, then UEFI-compliant binary will be
#       generated for it, but the binary will not be put into any firmware volume.
#
###################################################################################################
[Components]
  ##
  #  SEC Phase modules
  ##
  Nt32Pkg/Sec/SecMain.inf

  ##
  #  PEI Phase modules
  ##
  MdeModulePkg/Core/Pei/PeiMain.inf
  MdeModulePkg/Universal/PCD/Pei/Pcd.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  }
  MdeModulePkg/Universal/ReportStatusCodeRouter/Pei/ReportStatusCodeRouterPei.inf
  MdeModulePkg/Universal/StatusCodeHandler/Pei/StatusCodeHandlerPei.inf
  Nt32Pkg/WinNtOemHookStatusCodeHandlerPei/WinNtOemHookStatusCodeHandlerPei.inf
  Nt32Pkg/BootModePei/BootModePei.inf
  Nt32Pkg/StallPei/StallPei.inf
  Nt32Pkg/WinNtFlashMapPei/WinNtFlashMapPei.inf
  
  MdeModulePkg/Universal/FaultTolerantWritePei/FaultTolerantWritePei.inf
  MdeModulePkg/Universal/Variable/Pei/VariablePei.inf

  Nt32Pkg/WinNtAutoScanPei/WinNtAutoScanPei.inf
  Nt32Pkg/WinNtFirmwareVolumePei/WinNtFirmwareVolumePei.inf
  Nt32Pkg/WinNtThunkPPIToProtocolPei/WinNtThunkPPIToProtocolPei.inf
  MdeModulePkg/Core/DxeIplPeim/DxeIpl.inf
  ##
  #  DXE Phase modules
  ##
  MdeModulePkg/Core/Dxe/DxeMain.inf {
    <LibraryClasses>
      NULL|MdeModulePkg/Library/DxeCrc32GuidedSectionExtractLib/DxeCrc32GuidedSectionExtractLib.inf
      DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
    <BuildOptions>
      *_*_*_CC_FLAGS =
  }

  MdeModulePkg/Universal/PCD/Dxe/Pcd.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  }
  Nt32Pkg/MetronomeDxe/MetronomeDxe.inf
  Nt32Pkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf
  MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.inf
  MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.inf
  Nt32Pkg/FvbServicesRuntimeDxe/FvbServicesRuntimeDxe.inf
  MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf  {
    <LibraryClasses>
!if $(SECURE_BOOT_ENABLE) == TRUE
      NULL|SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.inf
!endif 
  }
  MdeModulePkg/Universal/SmbiosDxe/SmbiosDxe.inf
  MdeModulePkg/Universal/EbcDxe/EbcDxe.inf
  MdeModulePkg/Universal/MemoryTest/NullMemoryTestDxe/NullMemoryTestDxe.inf
  Nt32Pkg/WinNtThunkDxe/WinNtThunkDxe.inf
  Nt32Pkg/CpuRuntimeDxe/CpuRuntimeDxe.inf
  MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.inf
  Nt32Pkg/MiscSubClassPlatformDxe/MiscSubClassPlatformDxe.inf
  Nt32Pkg/TimerDxe/TimerDxe.inf
  MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.inf
  MdeModulePkg/Universal/StatusCodeHandler/RuntimeDxe/StatusCodeHandlerRuntimeDxe.inf
  Nt32Pkg/WinNtOemHookStatusCodeHandlerDxe/WinNtOemHookStatusCodeHandlerDxe.inf
  MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf {
    <LibraryClasses>
      NULL|MdeModulePkg/Library/VarCheckUefiLib/VarCheckUefiLib.inf
  }
!if $(SECURE_BOOT_ENABLE) == TRUE
  SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigDxe.inf
!endif
  MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf
  MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/MonotonicCounterRuntimeDxe.inf
  MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
  MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  }
  MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  }
  MdeModulePkg/Universal/Console/TerminalDxe/TerminalDxe.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  }
  MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf {
    <LibraryClasses>
      DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  }
  MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  FatPkg/EnhancedFatDxe/Fat.inf
  MdeModulePkg/Universal/Disk/UdfDxe/UdfDxe.inf
  MdeModulePkg/Bus/Pci/PciBusDxe/PciBusDxe.inf
  MdeModulePkg/Bus/Scsi/ScsiBusDxe/ScsiBusDxe.inf     ##This driver follows UEFI specification definition
  MdeModulePkg/Bus/Scsi/ScsiDiskDxe/ScsiDiskDxe.inf    ##This driver follows UEFI specification definition
  IntelFrameworkModulePkg/Bus/Pci/IdeBusDxe/IdeBusDxe.inf
  Nt32Pkg/WinNtBusDriverDxe/WinNtBusDriverDxe.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  }
  Nt32Pkg/WinNtBlockIoDxe/WinNtBlockIoDxe.inf
  Nt32Pkg/WinNtSerialIoDxe/WinNtSerialIoDxe.inf
  Nt32Pkg/WinNtGopDxe/WinNtGopDxe.inf
  Nt32Pkg/WinNtSimpleFileSystemDxe/WinNtSimpleFileSystemDxe.inf
  MdeModulePkg/Application/HelloWorld/HelloWorld.inf

  #
  # Network stack drivers
  # To test network drivers, need network Io driver(SnpNt32Io.dll), please refer to NETWORK-IO Subproject.
  #
  MdeModulePkg/Universal/Network/DpcDxe/DpcDxe.inf
  MdeModulePkg/Universal/Network/ArpDxe/ArpDxe.inf
  MdeModulePkg/Universal/Network/Dhcp4Dxe/Dhcp4Dxe.inf
  MdeModulePkg/Universal/Network/Ip4Dxe/Ip4Dxe.inf
  MdeModulePkg/Universal/Network/MnpDxe/MnpDxe.inf
  MdeModulePkg/Universal/Network/VlanConfigDxe/VlanConfigDxe.inf
  MdeModulePkg/Universal/Network/Mtftp4Dxe/Mtftp4Dxe.inf
  MdeModulePkg/Universal/Network/Udp4Dxe/Udp4Dxe.inf
  NetworkPkg/UefiPxeBcDxe/UefiPxeBcDxe.inf
  NetworkPkg/TcpDxe/TcpDxe.inf
  NetworkPkg/IScsiDxe/IScsiDxe.inf
  Nt32Pkg/SnpNt32Dxe/SnpNt32Dxe.inf

!if $(NETWORK_IP6_ENABLE) == TRUE
  NetworkPkg/Ip6Dxe/Ip6Dxe.inf
  NetworkPkg/Dhcp6Dxe/Dhcp6Dxe.inf
  NetworkPkg/Udp6Dxe/Udp6Dxe.inf
  NetworkPkg/Mtftp6Dxe/Mtftp6Dxe.inf
!endif

  NetworkPkg/HttpBootDxe/HttpBootDxe.inf
  NetworkPkg/DnsDxe/DnsDxe.inf
  NetworkPkg/HttpDxe/HttpDxe.inf
  NetworkPkg/HttpUtilitiesDxe/HttpUtilitiesDxe.inf

!if $(TLS_ENABLE) == TRUE
  NetworkPkg/TlsDxe/TlsDxe.inf
  NetworkPkg/TlsAuthConfigDxe/TlsAuthConfigDxe.inf
!endif

  MdeModulePkg/Universal/BdsDxe/BdsDxe.inf
  MdeModulePkg/Application/UiApp/UiApp.inf{
    <LibraryClasses>
      NULL|MdeModulePkg/Library/DeviceManagerUiLib/DeviceManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootManagerUiLib/BootManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib.inf
  }
  MdeModulePkg/Universal/DriverHealthManagerDxe/DriverHealthManagerDxe.inf
  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf
  MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe.inf
  MdeModulePkg/Universal/SetupBrowserDxe/SetupBrowserDxe.inf
  MdeModulePkg/Universal/PrintDxe/PrintDxe.inf
  MdeModulePkg/Universal/DriverSampleDxe/DriverSampleDxe.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  }
  MdeModulePkg/Application/VariableInfo/VariableInfo.inf

  MdeModulePkg/Universal/PlatformDriOverrideDxe/PlatformDriOverrideDxe.inf
  MdeModulePkg/Universal/LoadFileOnFv2/LoadFileOnFv2.inf
  MdeModulePkg/Application/BootManagerMenuApp/BootManagerMenuApp.inf {
    <LibraryClasses>
      NULL|IntelFrameworkModulePkg/Library/LegacyBootManagerLib/LegacyBootManagerLib.inf
  }
  MdeModulePkg/Logo/LogoDxe.inf
  ShellPkg/Application/Shell/Shell.inf {
    <PcdsFixedAtBuild>
      gEfiShellPkgTokenSpaceGuid.PcdShellLibAutoInitialize|FALSE
    <LibraryClasses>
      NULL|ShellPkg/Library/UefiShellLevel2CommandsLib/UefiShellLevel2CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellLevel1CommandsLib/UefiShellLevel1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellLevel3CommandsLib/UefiShellLevel3CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellDriver1CommandsLib/UefiShellDriver1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellInstall1CommandsLib/UefiShellInstall1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellDebug1CommandsLib/UefiShellDebug1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellNetwork1CommandsLib/UefiShellNetwork1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellNetwork2CommandsLib/UefiShellNetwork2CommandsLib.inf
      ShellLib|ShellPkg/Library/UefiShellLib/UefiShellLib.inf
      ShellCommandLib|ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
      HandleParsingLib|ShellPkg/Library/UefiHandleParsingLib/UefiHandleParsingLib.inf
      BcfgCommandLib|ShellPkg/Library/UefiShellBcfgCommandLib/UefiShellBcfgCommandLib.inf
      FileHandleLib|MdePkg/Library/UefiFileHandleLib/UefiFileHandleLib.inf
  }

  TestPkg/Application/TestApp/TestApp.inf{
    <LibraryClasses>
      PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  }

###################################################################################################
#
# BuildOptions Section - Define the module specific tool chain flags that should be used as
#                        the default flags for a module. These flags are appended to any
#                        standard flags that are defined by the build process. They can be
#                        applied for any modules or only those modules with the specific
#                        module style (EDK or EDKII) specified in [Components] section.
#
###################################################################################################
[BuildOptions]
  DEBUG_*_*_DLINK_FLAGS = /EXPORT:InitializeDriver=$(IMAGE_ENTRY_POINT) /BASE:0x10000 /ALIGN:4096 /FILEALIGN:4096 /SUBSYSTEM:CONSOLE
  NOOPT_*_*_DLINK_FLAGS = /EXPORT:InitializeDriver=$(IMAGE_ENTRY_POINT) /BASE:0x10000 /ALIGN:4096 /FILEALIGN:4096 /SUBSYSTEM:CONSOLE
  RELEASE_*_*_DLINK_FLAGS = /ALIGN:4096 /FILEALIGN:4096
