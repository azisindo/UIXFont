{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RMKDBCalendar;

{$warn 5023 off : no warning about unused units}
interface

uses
  unitRMKDBCalendar, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('unitRMKDBCalendar', @unitRMKDBCalendar.Register);
end;

initialization
  RegisterPackage('RMKDBCalendar', @Register);
end.
