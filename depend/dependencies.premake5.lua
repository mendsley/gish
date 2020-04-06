-------------------------------------------------------------------------------
project "libogg"
	kind "StaticLib"

	includedirs {
		"libogg/include",
	}

	files {
		"libogg/include/**.h",
		"libogg/src/*.c",
	}

-------------------------------------------------------------------------------
project "libvorbis"
	kind "StaticLib"

	includedirs {
		"libogg/include",
		"libvorbis/include",
	}

	files {
		"libvorbis/include/**.h",
		"libvorbis/lib/**.h",
		"libvorbis/lib/**.c",
	}

	removefiles {
		"libvorbis/lib/misc.c",
		"libvorbis/lib/psytune.c",
		"libvorbis/lib/tone.c",
	}

	filter "system:windows"
		defines {
			"_CRT_SECURE_NO_WARNINGS",
		}

		buildoptions {
			"/wd4100",
			"/wd4189",
			"/wd4305",
			"/wd4127",
			"/wd4706",
			"/wd4244",
			"/wd4267",
		}

	filter {}

-------------------------------------------------------------------------------
project "openal"
	kind "StaticLib"

	defines {
		"AL_BUILD_LIBRARY",
		"AL_ALEXT_PROTOTYPES",
	}

	includedirs {
		"contrib/openal",
		"openal/include",
		"openal/common",
		"openal/",
		"openal/alc",
	}

	files {
		"openal/include/**",
		"openal/al/**",
		"openal/alc/*",
		"openal/alc/backends/base.*",
		"openal/alc/effects/*",
		"openal/alc/filters/*",
		"openal/alc/mixer/*",
		"openal/common/*",
	}

	filter "system:windows"
		defines {
			"_CRT_SECURE_NO_WARNINGS",
			"NOMINMAX",
		}

		buildoptions {
			"/wd4065",
			"/wd4268",
			"/wd4324",
		}

		files {
			"openal/alc/backends/dsound.*",
			"openal/alc/backends/loopback.*",
			"openal/alc/backends/null.*",
			"openal/alc/backends/wasapi.*",
			"openal/alc/backends/wave.*",
			"openal/alc/backends/winmm.*",
		}

		removefiles {
			"openal/alc/mixer/mixer_neon.cpp",
		}

	filter {}

-------------------------------------------------------------------------------
project "sdl"
	kind "StaticLib"

	includedirs {
		"contrib/sdl",
		"sdl/include",
	}

	files {
		"sdl/include/**.h",
		"sdl/src/*",
		"sdl/src/audio/*",
		"sdl/src/cdrom/*",
		"sdl/src/cpuinfo/*",
		"sdl/src/events/*",
		"sdl/src/file/*",
		"sdl/src/joystick/*",
		"sdl/src/loadso/*",
		"sdl/src/stdlib/*",
		"sdl/src/thread/*",
		"sdl/src/timer/*",
		"sdl/src/video/*",

		"sdl/src/*/dummy/**",
	}

	removefiles {
		"sdl/src/main/dummy/**",
	}

	filter "system:windows"
		defines {
			"_CRT_SECURE_NO_WARNINGS",
		}

		files {
			"sdl/src/*/win32/**",

			"sdl/src/audio/disk/**",
			"sdl/src/audio/windib/**",
			"sdl/src/audio/windx5/**",
			"sdl/src/video/wincommon/**",
			"sdl/src/video/windib/**",
			"sdl/src/video/windx5/**",
		}

		buildoptions {
			"/wd4244",
			"/wd4267",
		}

		links {
			"Winmm",
			"dxguid",
		}

	filter {}

