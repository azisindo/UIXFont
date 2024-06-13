{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RMKComboBox;

{$warn 5023 off : no warning about unused units}
interface

uses
  UnitRMKComboBox, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('UnitRMKComboBox', @UnitRMKComboBox.Register);
end;

initialization
  RegisterPackage('RMKComboBox', @Register);
end.
