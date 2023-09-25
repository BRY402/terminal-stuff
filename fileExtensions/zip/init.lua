local DataSerializer = require(10289407850)
terminal.extensions.zip = function(file)
    return DataSerializer.Deserialize(file.Source)
end
file.Events.FileCreated:Connect(function(file)
    if string.match(file.Name or "", ".*%.zip") then
        file.Source = DataSerializer.Serialize({file.Source})
    end
end)