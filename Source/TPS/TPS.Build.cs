// Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System;

public class TPS : ModuleRules
{
    public TPS(ReadOnlyTargetRules Target) : base(Target)
    {
        Console.WriteLine("TPS module rules: ------------------------------------------>");
        Console.WriteLine("Engine version: {0}.{1}.{2}",
            Target.Version.MajorVersion, Target.Version.MinorVersion, Target.Version.PatchVersion);
        Console.WriteLine("Target platform: {0}", Target.Platform);
        Console.WriteLine("Target type: {0}", Target.Type);

        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

        PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore"});
    }
}