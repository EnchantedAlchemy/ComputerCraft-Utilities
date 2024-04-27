local textFunctions = require("utilities/textFunctions")

while true do

    settings.load(".settings")

    if textFunctions.prompt("Enter a value:", "Edit Setting", "Exit") == 1 then

        local edittedSetting = textFunctions.choicePrompt("Which setting would you like to edit?", table.unpack(settings.getNames()))

        local function editSetting()
            print("Current Value: " + settings.get(edittedSetting))
            settings.set(edittedSetting, textFunctions.prompt("What value would you like to give " + edittedSetting + "?"))
        end

        if pcall(editSetting) then
            print("Changed value of " + edittedSetting + ".")
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
