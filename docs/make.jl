using NeutrinoSurrogateModelData
using Documenter

DocMeta.setdocmeta!(NeutrinoSurrogateModelData, :DocTestSetup, :(using NeutrinoSurrogateModelData); recursive=true)

makedocs(;
    modules=[NeutrinoSurrogateModelData],
    authors="Christian Haack",
    sitename="NeutrinoSurrogateModelData.jl",
    format=Documenter.HTML(;
        canonical="https://chrhck.github.io/NeutrinoSurrogateModelData.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/chrhck/NeutrinoSurrogateModelData.jl",
    devbranch="main",
)
