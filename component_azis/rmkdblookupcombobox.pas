{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RMKDBLookupComboBox;

{$warn 5023 off : no warning about unused units}
interface

uses
  unitRMKDBLookupComboBox, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('unitRMKDBLookupComboBox', @unitRMKDBLookupComboBox.Register);
end;

initialization
  RegisterPackage('RMKDBLookupComboBox', @Register);
end.
