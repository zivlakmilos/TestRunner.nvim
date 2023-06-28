M = {}

function M.setup(config)
	if not config then
		config = {}
	end
	local curDir = vim.fn.getcwd()
	print("Hello World!")
	print(curDir)
end

function M.run_test()
	local extension = vim.bo.filetype
	local command = nil

	if extension == "lua" then
		command = 'call jobsend(b:terminal_job_id, "")'
	elseif extension == "js" or extension == "ts" or extension == "jsx" or extension == "tsx" then
		command = "call jobsend(b:terminal_job_id, \"nvim --headless -c 'PlenaryBustedDirectory tests'\")"
	end

	if command then
		vim.cmd("vsplit | terminal")
		vim.cmd(command)
	end
end

return M
