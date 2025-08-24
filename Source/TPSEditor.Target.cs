// Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System.Collections.Generic;
using System;

public class TPSEditorTarget : TargetRules
{
    public TPSEditorTarget(TargetInfo Target) : base(Target)
    {
        Console.WriteLine("TPS editor target: ------------------------------------------>");

        Type = TargetType.Editor;
        ExtraModuleNames.Add("TPS");
    }
}
