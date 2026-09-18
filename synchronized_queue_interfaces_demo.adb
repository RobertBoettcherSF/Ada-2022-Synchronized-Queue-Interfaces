pragma Ada_2022;

with Ada.Containers; use Ada.Containers;

package body Synchronized_Queue_Interfaces_Demo is

   protected body Tiny_Queue is

      entry Enqueue (New_Item : Integer) when Count < Capacity is
      begin
         Buf (Tail) := New_Item;
         Tail := (if Tail = Capacity then 1 else Tail + 1);
         Count := Count + 1;
         if Count > Peak then
            Peak := Count;
         end if;
      end Enqueue;

      entry Dequeue (Element : out Integer) when Count > 0 is
      begin
         Element := Buf (Head);
         Head := (if Head = Capacity then 1 else Head + 1);
         Count := Count - 1;
      end Dequeue;

      function Current_Use return Count_Type is
      begin
         return Count;
      end Current_Use;

      function Peak_Use return Count_Type is
      begin
         return Peak;
      end Peak_Use;

   end Tiny_Queue;

   function Round_Trip return Boolean is
      Q : Tiny_Queue;
      A, B, C : Integer;
   begin
      Q.Enqueue (10);
      Q.Enqueue (20);
      Q.Enqueue (30);
      if Q.Current_Use /= 3 then
         return False;
      end if;
      Q.Dequeue (A);
      Q.Dequeue (B);
      Q.Dequeue (C);
      return A = 10 and then B = 20 and then C = 30
        and then Q.Current_Use = 0
        and then Q.Peak_Use = 3;
   end Round_Trip;

end Synchronized_Queue_Interfaces_Demo;
