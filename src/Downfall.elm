module Downfall exposing (..)

import Set exposing (Set)



type alias Hero =
    { occupation: TraditionLink
    , rebellion: TraditionLink
    , name: String
    , description: String
    }

type alias NonHero =
    { relationshipToHero: (RelationshipCategory, String)
    , occupation: TraditionLink
    , name: String
    , description: String
    , isAlive: Bool
    }



type RelationshipCategory = Family | Friend | Guardian | Leader | Lover    


type alias Tradition =
    { category: String
    , description: String
    , symbol: String
    }

type alias TraditionLink = 
    { tradition: Tradition
    , description: String
    }

type alias Round =
    { corruption: String
    , heroScene: Scene
    , fallenScene: Scene
    , heroReflection: String
    , destroyHaven: Bool
    }

type Action
    = HeroAction {description: String, consequence: Maybe String}
    | NonHeroAction String

type alias Scene =
    { whereHeroIs: String
    , otherCharacters: List NonHero
    , situation: String
    , fallenRoles: List NonHero
    , pillarRoles: List NonHero
    , events : List Action
    }