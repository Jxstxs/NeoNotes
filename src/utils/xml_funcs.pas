
{$WARNINGS OFF}
unit xml_funcs;

{$mode ObjFPC}{$H+}

interface

uses
  DOM, XMLWrite, XMLRead, data_types,
  Classes, SysUtils;

procedure addXmlDataNode(var _settings: TXMLDocument;
  var root: TDOMNode; setting, Data: string);

procedure addXmlArrayNode(var _settings: TXMLDocument;
  var root_array: TDOMNode; node_name, attribute, Data, content: string);

function get_node_content(settings: TXMLDocument; node: string): string;
function getRecentNotes(settings: TXMLDocument): arRecentNotes;

implementation

procedure addXmlDataNode(var _settings: TXMLDocument;
  var root: TDOMNode; setting, Data: string);

var
  settings_node, data_node: TDOMNode;
begin
  settings_node := _settings.CreateElement(setting);
  root.Appendchild(settings_node);

  data_node := _settings.CreateTextNode(Data);
  settings_node.Appendchild(data_node);
end;

procedure addXmlArrayNode(var _settings: TXMLDocument;
  var root_array: TDOMNode; node_name, attribute, Data, content: string);

var
  array_node, data_node: TDOMNode;
begin
  array_node := _settings.CreateElement(node_name);
  TDOMElement(array_node).SetAttribute(attribute, Data);
  root_array.AppendChild(array_node);

  data_node := _settings.CreateTextNode(content);
  array_node.AppendChild(data_node);
end;

function get_node_content(settings: TXMLDocument; node: string): string;

var
  node_: TDOMNode;
begin
  node_ := settings.DocumentElement.FindNode(node);
  result := node_.TextContent;
end;

function getRecentNotes(settings: TXMLDocument): arRecentNotes;

var
  nodes: TDOMNode;
  node, data_node: TDOMNode;

  i: integer;

  recentNotes: arRecentNotes;
  rn_count: integer;
begin
  rn_count := 0;
  SetLength(recentNotes, rn_count);

  nodes := settings.DocumentElement.FindNode('recent_notes');
  while Assigned(nodes) do
  begin
    with nodes.ChildNodes do
      try
        for i := 0 to (Count - 1) do
        begin
          rn_count := rn_count + 1;
          SetLength(recentNotes, rn_count);

          recentNotes[rn_count - 1].collection :=
            Item[i].Attributes.Item[0].NodeValue;
          recentNotes[rn_count - 1].title :=
            Item[i].TextContent;
        end;
      finally
        Free;
      end;
    nodes := nodes.NextSibling;
  end;

  result := recentNotes;
end;

end.
