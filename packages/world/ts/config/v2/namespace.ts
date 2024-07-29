import { NamespaceInput, SystemsInput } from "./input";
import {
  hasOwnKey,
  validateNamespace as validateStoreNamespace,
  resolveNamespace as resolveStoreNamespace,
  Scope,
  AbiTypeScope,
} from "@latticexyz/store/config/v2";
import { resolveSystems, validateSystems } from "./systems";

export type validateNamespace<input, scope extends Scope = AbiTypeScope> = {
  [key in keyof input]: key extends "systems" ? validateSystems<input[key]> : validateStoreNamespace<input, scope>[key];
};

export function validateNamespace<scope extends Scope = AbiTypeScope>(
  input: unknown,
  scope: scope,
): asserts input is NamespaceInput {
  if (hasOwnKey(input, "systems")) {
    validateSystems(input.systems);
  }
  validateStoreNamespace(input, scope);
}

export type resolveNamespace<input, scope extends Scope = AbiTypeScope> = input extends NamespaceInput
  ? resolveStoreNamespace<input, scope> & {
      readonly systems: input["systems"] extends SystemsInput
        ? resolveSystems<input["systems"], resolveStoreNamespace<input, scope>["namespace"]>
        : {};
    }
  : never;

export function resolveNamespace<const input extends NamespaceInput, scope extends Scope = AbiTypeScope>(
  input: input,
  scope: scope = AbiTypeScope as never,
): resolveNamespace<input, scope> {
  const namespace = resolveStoreNamespace(input, scope);
  const systems = resolveSystems(input.systems ?? {}, namespace.namespace);
  return {
    ...namespace,
    systems,
  } as never;
}
