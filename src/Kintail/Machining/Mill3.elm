module Kintail.Machining.Mill3
    exposing
        ( Toolpath
        , ToolpathSegment
        , ArcType(..)
        , gCode
        , toolpath
        , commands
        , sequence
        , rapidMoveTo
        , lineTo
        , arc
        , command
        )

import OpenSolid.Geometry.Types exposing (..)


type Toolpath
    = Toolpath { toolNumber : Int, feedRate : Float, spindleSpeed : Float } (List ToolpathSegment)
    | Commands (List String)
    | Sequence (List Toolpath)


type ToolpathSegment
    = ToolpathSegment


type ArcType
    = RelativeIJ
    | AbsoluteIJ
    | Linearized


gCode : { arcType : ArcType, precision : Float } -> Toolpath -> List String
gCode parameters toolpath =
    case toolpath of
        Toolpath { toolNumber, feedRate, spindleSpeed } segments ->
            Debug.crash "TODO"

        Commands commands ->
            commands

        Sequence toolpaths ->
            Debug.crash "TODO"


toolpath :
    { toolNumber : Int, feedRate : Float, spindleSpeed : Float }
    -> List ToolpathSegment
    -> Toolpath
toolpath =
    Toolpath


commands : List String -> Toolpath
commands =
    Commands


sequence : List Toolpath -> Toolpath
sequence =
    Sequence
