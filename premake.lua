
-- IMPORTANT: do NOT delete any GEN: comments. They are used by the CLI to generate the project.
project "shado-bin-serialization"
    kind (app_type or "StaticLib")
    language "C++"
    cppdialect "C++11"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/**.h",
        "include/**.cpp",
        "include/**.hpp",
        "include/**.c",
    }

    includedirs
    {
        "include",
        -- GEN: Includes go here
    }

    links
    {
        -- GEN: Links go here
    }

    filter "system:windows"
        staticruntime "Off"
        systemversion "latest"

        postbuildcommands
        {
            -- GEN: postbuildcommands go here
        }

    filter "configurations:Debug"
        defines "SHADO_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "SHADO_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "SHADO_DIST"
        optimize "Full"
