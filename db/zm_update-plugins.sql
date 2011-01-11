--
-- This is update from 1.24.2 version to plugins supporting architecture.
--

-- Add two columns to store plugins related information.
ALTER TABLE Monitors
ADD ( `UsedPl` varchar(88) NOT NULL default '',
      `DoNativeMotDet` varchar(5) NOT NULL default 'yes'
);

-- Insert some values into `Config' table.
INSERT INTO Config SET Id = 183, Name = 'ZM_PATH_PLUGINS', Value = '/usr/share/zm', Type = 'string', DefaultValue = '/usr/share/zm', Hint = '/absolute/path/to/somewhere', Pattern = '(?-xism:^((?:/[^/]*)+?)/?$)', Format = ' $1 ', Prompt = 'Path to the plugin folder', Help = '3d-party plugins have to be placed here.', Category = 'paths', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 184, Name = 'ZM_PLUGIN_EXTENSION', Value = '.zmpl', Type = 'string', DefaultValue = '.zmpl', Hint = '.bla', Pattern = '.(?-xism:^((?:/[^/]*)+?)/?$)', Format = ' $1 ', Prompt = 'Default extension of plugins to found', Help = '3d-party plugins extension.', Category = 'paths', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 185, Name = 'ZM_PLUGINS_CONFIG_FILE', Value = '/usr/share/zm/plugins.conf', Type = 'string', DefaultValue = '/usr/share/zm/plugins.conf', Hint = '/absolute/path/to/somewhere', Pattern = '(?-xism:^((?:/[^/]*)+?)/?$)', Format = ' $1 ', Prompt = 'Path to the config file for plugins', Help = 'Path to the config file for plugins.', Category = 'paths', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 186, Name = 'ZM_LOAD_PLUGINS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?i-xsm:^([yn]))', Format = ' $1 =~ /^y/) ? \"yes\" : \"no\" ', Prompt = 'Load and use 3d-party plugins', Help = '3d-party plugins will be loaded and used for analysing.', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 187, Name = 'ZM_TURNOFF_NATIVE_ANALYSIS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?i-xsm:^([yn]))', Format = ' $1 =~ /^y/) ? \"yes\" : \"no\" ', Prompt = 'Turn native ZM\'s image analysis possibility off', Help = 'Image analysis with ZM\'s motion detected function will be turned off. Only detection functions from loaded plugins will be used. Note, that if no plugins have be loaded, no detection will be done', Category = 'config', Readonly = '0', Requires = '';

--
-- These are optional, but we might as well
--
optimize table Frames;
optimize table Events;
optimize table Filters;
optimize table Zones;
optimize table Monitors;
optimize table Stats;
