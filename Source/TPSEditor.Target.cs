// This project uses GPL v3.0 licencing terms

using UnrealBuildTool;
using System.Collections.Generic;

public class TPSEditorTarget : TargetRules 
{ 
	public TPSEditorTarget(TargetInfo Target) : base(Target) 
	{ 
		Type = TargetType.Editor; 
		DefaultBuildSettings = BuildSettingsVersion.V4; 
		ExtraModuleNames.AddRange( new string[] { "TPS" } ); 
	} 
} 
