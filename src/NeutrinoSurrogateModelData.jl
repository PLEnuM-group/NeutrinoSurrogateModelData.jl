module NeutrinoSurrogateModelData

export modelpath
export em_cascade_time_model, lightsabre_time_model

const MODEL_DIR = joinpath(@__DIR__, "..", "model_data")

modelpath(p...) = joinpath(MODEL_DIR, p...)

const PERTURB_MEDIUM_MODEL = "time_surrogate_perturb"
const CONST_MEDIUM_MODEL = "time_surrogate_const"

@enum TIME_SURROGATE_TYPES EM_CASCADE_TIME_SURROGATE LIGHTSABRE_TIME_SURROGATE

const TIME_SURROGATE_PATHS = Dict(
    EM_CASCADE_TIME_SURROGATE=>"extended",
    LIGHTSABRE_TIME_SURROGATE=>"lightsabre"
    )

function time_surrogate_paths(time_uncert, model_type::TIME_SURROGATE_TYPES, perturb_medium)
   
    type_path = TIME_SURROGATE_PATHS[model_type]
    medium_path = perturb_medium ? PERTURB_MEDIUM_MODEL : CONST_MEDIUM_MODEL
    path_amp = modelpath(medium_path, type_path, "amp.bson")
    path_time = modelpath(medium_path, type_path, "time_$time_uncert.bson")
    return path_amp, path_time
end

function em_cascade_time_model(time_uncert; perturb_medium=true)
    return time_surrogate_paths(time_uncert, EM_CASCADE_TIME_SURROGATE, perturb_medium)
end

function lightsabre_time_model(time_uncert; perturb_medium=true)
    return time_surrogate_paths(time_uncert, LIGHTSABRE_TIME_SURROGATE, perturb_medium)
end

end
