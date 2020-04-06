workspace "gish"
	location "VisualC"

	platforms {"x64"}
	configurations {"Debug", "Release"}
	startproject "gish"
	symbols "Full"
	debugformat "C7"
	characterset "MBCS"

	filter "Release"
		optimize "On"

	filter {}

dofile "depend/dependencies.premake5.lua"

project "gish"
	kind "WindowedApp"
	debugdir "runtime"

	includedirs {
		"depend/contrib/sdl",

		"depend/libogg/include",
		"depend/libvorbis/include",
		"depend/openal/include",
		"depend/sdl/include",
	}

	links {
		"sdl",
		"libogg",
		"libvorbis",
		"openal",

		"OpenGL32",
	}

	defines {
		"_CRT_SECURE_NO_WARNINGS",
		"AL_LIBTYPE_STATIC",
	}

	buildoptions {
		"/wd4013",
		"/wd4018",
		"/wd4091",
		"/wd4101",
		"/wd4244",
		"/wd4267",
		"/wd4305",
	}

	files {
		"src/**",
		"src/main.c",
	}

	filter "files:src/**"
		flags "ExcludeFromBuild"

	filter "files:src/main.c"
		removeflags "ExcludeFromBuild"

	filter {}
