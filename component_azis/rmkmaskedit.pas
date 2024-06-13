{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RMKMaskEdit;

{$warn 5023 off : no warning about unused units}
interface

uses
  unitRMKMaskEdit, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('unitRMKMaskEdit', @unitRMKMaskEdit.Register);
end;

initialization
  RegisterPackage('RMKMaskEdit', @Register);
end.
