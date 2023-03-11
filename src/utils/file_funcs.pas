
unit file_funcs;

{$mode ObjFPC}{$H+}

interface

uses
  SysUtils;

type
  eMTypes = (s, ari);
  rMultiType = record
    s: string;
    ari: array of integer;
  end;


procedure checkDataDir();
procedure loadSettingsFromFile();

function createCollection(title, author: string): Boolean;
function MT(_t: eMTypes; _v: variant): rMultiType;

implementation

uses
  data_types, DOM, XMLWrite, XMLRead, xml_funcs, db_manager, Dialogs;

procedure checkDataDir();

var
  usr_home: string;
  settings_path: string;

  settings: TXMLDocument;
  root_node: TDOMNode;
  array_node: TDOMNode;
begin
  // Getting the Home Directory of the User
  usr_home := GetUserDir;
  if (usr_home = '') then
  begin
    writeLn('ERROR: Cant get User Home');
    exit;
  end;

  nnConfig.dataPath := usr_home + '.SchoolNotes';
  // Check if a SchoolNotes Directory already exists
  if (not DirectoryExists(nnConfig.dataPath)) then
    CreateDir(nnConfig.dataPath);

  settings_path := nnConfig.dataPath + nnConfig.pathDelim + 'settings.xml';
  // Check if a Configuration file exists
  if (not FileExists(settings_path)) then
    try
      // Creating the XML Configuration file
      settings := TXMLDocument.Create;
      root_node := settings.CreateElement('settings');
      settings.Appendchild(root_node);

      addXmlDataNode(settings, root_node, 'open_recent', 'false');

      array_node := settings.CreateElement('recent_notes');
      root_node.Appendchild(array_node);

      // Write the File to Disk
      writeXMLFile(settings, settings_path);
    finally
      settings.Free;
    end;
end;


procedure loadSettingsFromFile();

var
  settings: TXMLDocument;

  settings_path: string;
begin
  try
    // Read the Settings File
    settings_path := nnConfig.dataPath + nnConfig.pathDelim +
      'settings.xml';
    ReadXMLFile(settings, settings_path);

    // Reading in the Settings
    nnConfig.openRecent :=
      StrToBool(get_node_content(settings, 'open_recent'));
    nnConfig.recentNotes := getRecentNotes(settings);

  finally
    settings.Free;
  end;
end;

function createCollection(title, author: string): Boolean;
var
  collection_path: string;
begin
  collection_path := nnConfig.dataPath + nnConfig.pathDelim + title + '.nnc';
  if not FileExists(collection_path) then
    begin
    nnConfig.db_mng.setupDb(collection_path, author);
    Result:= True;
    end
  else Result := False;
end;

function MT(_t: eMTypes; _v: variant): rMultiType;

var
  _mt: rMultiType;
begin
  case _t of
    s: _mt.s := _v;
    ari: _mt.ari := _v;
  end;
  result := _mt;
end;

end.
