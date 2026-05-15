#!/bin/bash

set -e

FLAGS="--layout elk --scale 1.5 --pad 20"
FORMAT="png"

# data flow through layers
d2 $FLAGS data_flow_through_layers.d2 data_flow_through_layers.$FORMAT

# query optimization — sequence diagram (no layout engine for sequence diagrams)
d2 --scale 1.5 --pad 20 query_optimization_sequence.d2 query_optimization_sequence.$FORMAT

# query plan — before/after comparison
d2 $FLAGS query_plan_comparison.d2 query_plan_comparison.$FORMAT

# git workflow
d2 $FLAGS git_workflow.d2 git_workflow.$FORMAT

# microservices architecture
d2 $FLAGS microservices_architecture.d2 microservices_architecture.$FORMAT

# app-service ER diagram
d2 $FLAGS app_service_er.d2 app_service_er.$FORMAT

echo "Done"
exit 0
