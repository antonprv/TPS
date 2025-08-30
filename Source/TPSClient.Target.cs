// This project uses GPL v3.0 licencing terms

using UnrealBuildTool;
using System.Collections.Generic;

public class TPSClientTarget : TargetRules 
{ 
	public TPSClientTarget(TargetInfo Target) : base(Target) 
	{ 
		Type = TargetType.Client; 
		ExtraModuleNames.AddRange( new string[] { "TPS" } ); 
	} 
} 
