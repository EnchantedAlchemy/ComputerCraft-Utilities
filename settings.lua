local textFunctions = require("textFunctions")
textFunctions.clear()

while true do

    settings.load(".settings")

    if textFunctions.choicePrompt("Enter a value:", "Edit Setting", "Exit") == 1 then

        local edittedSetting = settings.getNames()[textFunctions.choicePrompt("Which setting would you like to edit?", table.unpack(settings.getNames()))]
        print("Current Value: " .. settings.get(edittedSetting))
        local newValue = textFunctions.prompt("What value would you like to give " .. edittedSetting .. "?")

        local function editSetting()
            settings.set(edittedSetting, newValue)
        end

        if pcall(editSetting) then
            print("Changed value of " .. edittedSetting .. ".")
            settings.save(".settings")
            os.sleep(2)
        else
            printError("Value not acceptable.")
            os.sleep(2)
        end

    else

        break

    end

end
