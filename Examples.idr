
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
  Coins : (currency : Currency) -> (amount : Nat) -> Money currency

addMoney : (a : Money c) -> (b : Money c) -> Money c
addMoney (Coins _ x) (Coins _ y) = Coins _ (x + y)

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

data SizedString : (length : Nat) -> Type where
  Empty : SizedString Z
  NonEmpty : (first : Char) -> (rest : SizedString n) -> SizedString (S n)

first : (str : SizedString n) -> Maybe Char
first Empty = Nothing
first (NonEmpty c rest) = Just c

smartFirst : (str : SizedString (S n)) -> Char
smartFirst (NonEmpty x rest) = x

prependFoo : (str : SizedString n) -> SizedString (3 + n)
prependFoo s = NonEmpty 'f' (NonEmpty 'o' (NonEmpty 'o' s))

append : (str1 : SizedString n) -> (str2 : SizedString m) -> SizedString (n + m)
append Empty str2 = str2
append (NonEmpty c rest) str2 = NonEmpty c (append rest str2)
