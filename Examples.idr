
{- (already in Prelude!)
data Bool : Type where
  True : Bool
  False : Bool
-}

yesNo : (b : Bool) -> String
yesNo True = "Yes"
yesNo False = "No"

{- (already in Prelude!)
data Maybe : Type -> Type where
  Nothing : Maybe a
  Just : a -> Maybe a
-}

justOrDefault : (value : Maybe a) -> (default : a) -> a
justOrDefault Nothing default = default
justOrDefault (Just x) default = x

data Currency : Type where
  Pound : Currency
  Dollar : Currency
  Euro : Currency

data Money : Currency -> Type where
  Coins : (amount : Nat) -> Money c

addMoney : (a : Money c) -> (b : Money c) -> Money c
addMoney (Coins x) (Coins y) = Coins (x + y)

{-(already in Prelude!)
data Nat : Type where
  Z : Nat
  S : (minusOne : Nat) -> Nat
-}

natToString : (value : Nat) -> String
natToString Z = "0"
natToString (S k) = "1 + " ++ natToString k

data Vehicle : (wheels : Nat) -> Type where
  Lambo : Vehicle 4
  KiaCeed: Vehicle 4
  ReliantRobin : Vehicle 3
  Bicycle : Vehicle 2

clarksonComment : (vehicleWithThreeOrMoreWheels : Vehicle (S (S (S n)))) -> String
clarksonComment Lambo = "Blah blah blah, exhaust noise."
clarksonComment KiaCeed = "So reasonably priced!"
clarksonComment ReliantRobin = "This car corners like nothing else!"

clean : (vehicle : Vehicle n) -> String
clean {n} vehicle = "Cleaning all " ++ show n ++ " wheels..."

doWheelie : (twoWheeledVehicle : Vehicle 2) -> String
doWheelie Bicycle = "Woohoo!"

data Vect : (length : Nat) -> (elements : Type) -> Type where
  Empty : Vect Z elem
  NonEmpty : (first : elem) -> (rest : Vect n elem) -> Vect (S n) elem

first : (vect : Vect n elem) -> Maybe elem
first Empty = Nothing
first (NonEmpty x rest) = Just x

smartFirst : (vect : Vect (S n) elem) -> elem
smartFirst (NonEmpty x rest) = x

addFoo : (vect : Vect n Char) -> Vect (3 + n) Char
addFoo vect = NonEmpty 'f' (NonEmpty 'o' (NonEmpty 'o' vect))

append : (vect1 : Vect n elem) -> (vect2 : Vect m elem) -> Vect (n + m) elem
append Empty vect2 = vect2
append (NonEmpty x rest) vect2 = NonEmpty x (append rest vect2)
