# =============================================================================
# MAKEFILE - Orchestration des modules Terraform standalone
# =============================================================================

MODULES_DIR := modules
NETWORK     := $(MODULES_DIR)/network
COMPUTE     := $(MODULES_DIR)/compute
DOMAIN      := $(MODULES_DIR)/domain
ANSIBLE		:= ../deployment
PLAYBOOK	:= ${ANSIBLE}/playbook.yml

# Couleurs
GREEN  := \033[0;32m
YELLOW := \033[0;33m
RED    := \033[0;31m
RESET  := \033[0m

# =============================================================================
# DEPLOIEMENT COMPLET
# =============================================================================

.PHONY: all
all: init-all apply-all ansible-playbook

# =============================================================================
# INIT
# =============================================================================
.PHONY: init-all init-network init-compute init-domain
init-all: init-network init-compute init-domain ## Init all modules

init-network:
	@printf "$(GREEN)━━━ [INIT] Network ━━━$(RESET)\n"
	cd $(NETWORK) && terraform init

init-compute:
	@printf "$(GREEN)━━━ [INIT] Compute ━━━$(RESET)\n"
	cd $(COMPUTE) && terraform init

init-domain:
	@printf "$(GREEN)━━━ [INIT] Domain ━━━$(RESET)\n"
	cd $(DOMAIN) && terraform init

# =============================================================================
# PLAN
# =============================================================================
.PHONY: plan-all plan-network plan-compute plan-domain
plan-all: plan-network plan-compute plan-domain ## Plan all modules

plan-network:
	@printf "$(YELLOW)━━━ [PLAN] Network ━━━$(RESET)\n"
	cd $(NETWORK) && terraform plan

plan-compute:
	@printf "$(YELLOW)━━━ [PLAN] Compute ━━━$(RESET)\n"
	cd $(COMPUTE) && terraform plan

plan-domain:
	@printf "$(YELLOW)━━━ [PLAN] Domain ━━━$(RESET)\n"
	cd $(DOMAIN) && terraform plan

# =============================================================================
# APPLY
# =============================================================================
.PHONY: apply-all apply-network apply-compute apply-domain
apply-all: apply-network apply-compute apply-domain ## Apply all modules in order

apply-network:
	@printf "$(GREEN)━━━ [APPLY] Network ━━━$(RESET)\n"
	cd $(NETWORK) && terraform apply -auto-approve

apply-compute: apply-network
	@printf "$(GREEN)━━━ [APPLY] Compute ━━━$(RESET)\n"
	cd $(COMPUTE) && terraform apply -auto-approve

apply-domain: apply-network
	@printf "$(GREEN)━━━ [APPLY] Domain ━━━$(RESET)\n"
	cd $(DOMAIN) && terraform apply -auto-approve

# =============================================================================
# DESTROY (ordre inverse : domain → compute → network)
# =============================================================================
.PHONY: destroy-all destroy-network destroy-compute destroy-domain
destroy-all: destroy-domain destroy-compute destroy-network ## Destroy all modules (reverse order)

destroy-domain:
	@printf "$(RED)━━━ [DESTROY] Domain ━━━$(RESET)\n"
	cd $(DOMAIN) && terraform destroy -auto-approve

destroy-compute:
	@printf "$(RED)━━━ [DESTROY] Compute ━━━$(RESET)\n"
	cd $(COMPUTE) && terraform destroy -auto-approve

destroy-network:
	@printf "$(RED)━━━ [DESTROY] Network ━━━$(RESET)\n"
	cd $(NETWORK) && terraform destroy -auto-approve

# =============================================================================
# OUTPUT
# =============================================================================
.PHONY: output-all output-network output-compute output-domain
output-all: output-network output-compute output-domain ## Show all outputs

output-network:
	@printf "$(GREEN)━━━ [OUTPUT] Network ━━━$(RESET)\n"
	cd $(NETWORK) && terraform output

output-compute:
	@printf "$(GREEN)━━━ [OUTPUT] Compute ━━━$(RESET)\n"
	cd $(COMPUTE) && terraform output

output-domain:
	@printf "$(GREEN)━━━ [OUTPUT] Domain ━━━$(RESET)\n"
	cd $(DOMAIN) && terraform output

# =============================================================================
# ANSIBLE - PLAYBOOK
# =============================================================================
.PHONY: ansible-playbook

ansible-playbook: ## Deploy ansible playbook
	@printf "$(GREEN) ━━━ [DEPLOY] Ansible$(RESET)\n"
	cd $(ANSIBLE) && ansible-playbook ${PLAYBOOK}

# =============================================================================
# HELP
# =============================================================================
.PHONY: help
help: ## Show this help
	@printf "$(GREEN)Commandes disponibles :$(RESET)\n"
	@printf ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@printf ""
	@printf "$(GREEN)Modules individuels :$(RESET)\n"
	@printf "  $(YELLOW)init-$(RESET){network,compute,domain}$(RESET)\n"
	@printf "  $(YELLOW)plan-$(RESET){network,compute,domain}$(RESET)\n"
	@printf "  $(YELLOW)apply-$(RESET){network,compute,domain}$(RESET)\n"
	@printf "  $(YELLOW)destroy-$(RESET){network,compute,domain}$(RESET)\n"
	@printf "  $(YELLOW)output-$(RESET){network,compute,domain}$(RESET)\n"
