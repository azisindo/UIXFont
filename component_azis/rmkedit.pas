{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RMKEdit;

{$warn 5023 off : no warning about unused units}
interface

uses
  UnitRMKEdit, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('UnitRMKEdit', @UnitRMKEdit.Register);
end;

initialization
  RegisterPackage('RMKEdit', @Register);
end.
