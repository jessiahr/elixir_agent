defmodule NewRelic.Sampler.Reporter do
  @moduledoc false

  def report_sample(category, sample) when is_map(sample),
    do: NewRelic.report_custom_event(sampler_event_type(), Map.put(sample, :category, category))

  def sampler_event_type,
    do: Application.get_env(:new_relic, :sample_event_type, "ElixirSample")

  def sample_cycle, do: Application.get_env(:new_relic, :sample_cycle, 15_000)
end
