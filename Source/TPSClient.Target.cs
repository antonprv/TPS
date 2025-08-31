// GPL Public Licnese

using UnrealBuildTool;
using System.Collections.Generic;

public class TPSClientTarget : TargetRules 
{ 
	public TPSClientTarget(TargetInfo Target) : base(Target) 
	{ 
		Type = TargetType.Client; 
		DefaultBuildSettings = BuildSettingsVersion.V5; 
		ExtraModuleNames.AddRange( new string[] { "TPS"} ); 
	} 
} 
