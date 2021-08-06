package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestCloudServerSimple(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/simple/",
		NoColor:      true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
