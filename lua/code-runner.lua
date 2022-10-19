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
			command = "cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j 8 && ./bgfx_test"
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
		["~/Dev/CPP/OpenGLSomething/chap3"] = {
			name = "OpenGL Chap3",
			description = "Project with make file",
			command = "cd build && cmake .. && make && cd .. && ./build/main"
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
