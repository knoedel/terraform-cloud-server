package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestCloudServerFull(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/full/",
		NoColor:      true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
