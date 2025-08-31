// GPL Public Licnese

using UnrealBuildTool;
using System.Collections.Generic;

public class TPSServerTarget : TargetRules 
{ 
	public TPSServerTarget(TargetInfo Target) : base(Target) 
	{ 
		Type = TargetType.Server; 
		DefaultBuildSettings = BuildSettingsVersion.V5; 
		ExtraModuleNames.AddRange( new string[] { "TPS"} ); 
	} 
} 
