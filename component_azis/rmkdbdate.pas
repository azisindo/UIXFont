{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RMKDbDate;

{$warn 5023 off : no warning about unused units}
interface

uses
  unitRMKDBDateEdit, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('unitRMKDBDateEdit', @unitRMKDBDateEdit.Register);
end;

initialization
  RegisterPackage('RMKDbDate', @Register);
end.
