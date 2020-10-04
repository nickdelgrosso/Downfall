module TestDownfall exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

import Main
import Story exposing (Story)

suite : Test
suite =
    describe "The Story module"
        [ describe "Building the Setting"
            [ test "Setting the Flaw at the Start of the Story" <|
                \_ ->
                    Main.initialModel
                        |> Main.update (Main.SetFlaw "Greed")
                        |> .story
                        |> Story.getFlaw
                        |> Maybe.withDefault "None"
                        |> Expect.equal "greed"
            , test "Set the Elements" <|
                \_ ->
                    Main.initialModel
                        |> Main.update (Main.SetFlaw "Greed")
                        |> Main.update (Main.SetElements "Air" "Wind" "Fire")
                        |> .story
                        |> Story.getElements
                        |> Maybe.withDefault []
                        |> Expect.equal ["air", "wind", "fire"]
            ]

        ]
