local DataSerializer = require(10289407850)
terminal.extensions.zip = function(file)
    return DataSerializer.Deserialize(file.Source)
end