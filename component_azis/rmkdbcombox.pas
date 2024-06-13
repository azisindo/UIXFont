{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RMKDBComBox;

{$warn 5023 off : no warning about unused units}
interface

uses
  unitRMKDBComboBox, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('unitRMKDBComboBox', @unitRMKDBComboBox.Register);
end;

initialization
  RegisterPackage('RMKDBComBox', @Register);
end.
