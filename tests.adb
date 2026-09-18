pragma Ada_2022;
with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Synchronized_Queue_Interfaces_Demo;
procedure Tests is
begin
   Assert (Synchronized_Queue_Interfaces_Demo.Round_Trip);
   Put_Line ("PASS Synchronized_Queue_Interfaces Tiny_Queue");
   Put_Line ("All Synchronized_Queue_Interfaces topic tests passed.");
end Tests;
