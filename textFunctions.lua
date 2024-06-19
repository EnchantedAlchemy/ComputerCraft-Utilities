--Functions for simple terminal interaction and user input

local function clear()
    term.clear()
    term.setCursorPos(1,1)
end

local function resetComputer()

    settings.clear()
    settings.save(".settings")
    for i,v in pairs(fs.list("")) do
        if fs.isReadOnly(v) == false and v ~= "resetComputer" then
            shell.run("delete" .. v)
        end
    end
    shell.run("delete resetComputer")
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
