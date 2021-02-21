THIS_FILE := $(lastword $(MAKEFILE_LIST))

test:
	prove

dependencies-all: dependencies-dev

dependencies-prod:
	cpanm --sudo Locale::TextDomain Readonly JSON::MaybeXS Module::Load::Conditional

dependencies-dev:
	@$(MAKE) -f $(THIS_FILE) dependencies-prod
	cpanm --sudo Log::Log4perl