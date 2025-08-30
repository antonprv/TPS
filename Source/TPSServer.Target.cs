// This project uses GPL v3.0 licencing terms

using UnrealBuildTool;
using System.Collections.Generic;

public class TPSServerTarget : TargetRules 
{ 
	public TPSServerTarget(TargetInfo Target) : base(Target) 
	{ 
		Type = TargetType.Server; 
		DefaultBuildSettings = BuildSettingsVersion.V4; 
		ExtraModuleNames.AddRange( new string[] { "TPS" } ); 
	} 
} 
