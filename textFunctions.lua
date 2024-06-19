--Functions for simple terminal interaction and user input

local function clear()
    term.clear()
    term.setCursorPos(1,1)
end

local function resetComputer()

    settings.clear()
    settings.save(".settings")
    if fs.exists("main") then
        shell.run("delete main")
    end
    if fs.exists("gitget") then
        shell.run("delete gitget")
    end
    shell.run("delete startup")
    return

end

local function prompt(text, ...)

    while true do

        term.setTextColor(colors.white)
        print(text)

        for i,v in ipairs(arg) do
            print("(" .. i .. ") " .. v)
        end

        term.setTextColor(colors.yellow)
        input = read()
        term.setTextColor(colors.white)

        if input == nil or input == "" then
            clear()
            printError("Enter a valid input.")
        else
            return input
        end

    end

end

local function choicePrompt(text, ...)

    while true do

        input = tonumber(prompt(text, table.unpack(arg)))

        if input == nil or arg[input] == nil then
            clear()
            printError("Enter a valid input.")
        else
            return input
        end

    end

end

return { clear = clear, resetComputer = resetComputer, prompt = prompt, choicePrompt = choicePrompt }
