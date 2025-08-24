// Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System.Collections.Generic;
using System;

public class TPSTarget : TargetRules
{
    public TPSTarget(TargetInfo Target) : base(Target)
    {
        Console.WriteLine("TPS module rules: ------------------------------------------>");

        Type = TargetType.Game;
        ExtraModuleNames.Add("TPS");
    }
}