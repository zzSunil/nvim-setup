require('code_runner').setup {
	mode = "toggle",
	focus = true,
	startinsert = false,
	term = {
		position = "bot",
		size = 20,
	},
	project = {
		["~/deno/example"] = {
			name = "ExapleDeno",
			description = "Project with deno using other command",
			file_name = "http/main.ts",
			command = "deno run --allow-net"
		},
		["~/Dev/CPP/bgfx-things?"] = {
			name = "bgfx project",
			description = "bgfx cpp dev",
			command = "cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j 10 && ./bgfx_test"
		},
		["~/Dev/CPP/WhereToGo"] = {
			name = "Where to Go",
			description = "This way?? may be that one is better??",
			-- cmake --fresh .. -DPLATFORM=STREQUAL -DCMAKE_BUILD_TYPE=Debug
			command = "cd build && cmake .. -DPLATFORM=Desktop -DCMAKE_BUILD_TYPE=Debug && make -j10 && cd .. && ./build/WhereToGo"
		},
		["~/Dev/CPP/raylib_game"] = {
			name = "Raylib-someshing",
			description = "...",
			command = "cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j 10 && ./game"
		},
		["~/Dev/CPP/OpenGLSomething/chap2"] = {
			name = "OpenGL Chap2",
			description = "Project with make file",
			command = "cd build && cmake .. && make && cd .. && ./build/main"
		},
		["~/Dev/School/dataStructer/Assign1"] = {
			name = "datastructer lab",
			description = "Project with make file",
			command = "cc -g main.c && ./a.out"
		},
		["/home/zzlinus/Dev/CPP/bgfx-things?"] = {
			name = "datastructer lab",
			description = "Project with make file",
			command = "cd build && cmake .. && make && ./bgfx_test"
		},
		["~/Dev/CPP/OpenGLSomething/chap3"] = {
			name = "OpenGL Chap3",
			description = "Project with make file",
			command = "cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make && cd .. && ./build/main"
		},
		["/home/zzlinus/Dev/C/ysyx/ysyx-workbench/npc"] = {
			name = "ysyx npc",
			description = "ysyx nku lab",
			command = "make sim"
		},
		["/home/zzlinus/Dev/C/ysyx/ysyx-workbench/nemu"] = {
			name = "ysyx nemu",
			description = "ysyx nku lab",
			command = "make run"
		},
		["/home/zzlinus/Dev/Python/ueberzug"] = {
			name = "ueberzug nested tmux bug fixing",
			description = "",
			command = "./setup.sh build && chmod +x build/lib.linux-x86_64-cpython-310/ueberzug/__main__.py"
		},
		["/home/zzlinus/Dev/School/CPP/COVID"] = {
			name = "covid",
			description = "covid",
			command = "cd build && cmake .. && make && ./covid"
		},
		["~/Dev/CPP/OpenGLSomething/chap4"] = {
			name = "OpenGL Chap4",
			description = "Project with make file",
			command = "cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make && cd .. && ./build/main"
		}
	},
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},

}

vim.keymap.set('n', '<leader>cr', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>cf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>cp', ':CRProjects<CR>', { noremap = true, silent = false })
