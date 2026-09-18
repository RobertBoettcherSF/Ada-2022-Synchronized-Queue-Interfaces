--  Ada 2022 topic: Ada.Containers.Synchronized_Queue_Interfaces.
pragma Ada_2022;
with Ada.Containers;
with Ada.Containers.Synchronized_Queue_Interfaces;
package Synchronized_Queue_Interfaces_Demo is
   package Int_QI is new Ada.Containers.Synchronized_Queue_Interfaces
     (Element_Type => Integer);

   Capacity : constant Ada.Containers.Count_Type := 8;
   subtype Index is Ada.Containers.Count_Type range 1 .. Capacity;
   type Buffer is array (Index) of Integer;

   protected type Tiny_Queue is new Int_QI.Queue with
      overriding entry Enqueue (New_Item : Integer);
      overriding entry Dequeue (Element : out Integer);
      overriding function Current_Use return Ada.Containers.Count_Type;
      overriding function Peak_Use return Ada.Containers.Count_Type;
   private
      Buf   : Buffer := [others => 0];
      Head  : Index := 1;
      Tail  : Index := 1;
      Count : Ada.Containers.Count_Type := 0;
      Peak  : Ada.Containers.Count_Type := 0;
   end Tiny_Queue;

   function Round_Trip return Boolean;
end Synchronized_Queue_Interfaces_Demo;
