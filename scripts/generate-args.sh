#!/bin/bash
set -e
n=16

for i in `seq 1 ${n}`;do
  class="Arguments${i}"
  file="$(dirname $0)/../src/main/java/am/ik/yavi/arguments/${class}.java"
  echo $file
  cat <<EOF > ${file}
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

import am.ik.yavi.fn.Function${i};
import am.ik.yavi.jsr305.Nullable;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.3.0
 */
public class ${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//')> $(if [ ${i} -gt 1 ];then echo -n "extends Arguments$((${i} - 1))<$(echo $(for j in `seq 1 $((${i} - 1))`;do echo -n "A${j}, ";done) | sed 's/,$//')>"; else echo -n "";fi) {

	protected final A${i} arg${i};

	${class}($(echo $(for j in `seq 1 ${i}`;do echo -n "@Nullable A${j} arg${j}, ";done) | sed 's/,$//')) {$(if [ ${i} -gt 1 ];then echo;echo "		super($(echo $(for j in `seq 1 $((${i} - 1))`;do echo -n "arg${j}, ";done) | sed 's/,$//'));";fi)
		this.arg${i} = arg${i};
	}

	@Nullable
	public final A${i} arg${i}() {
		return this.arg${i};
	}

	public final <X> X map(Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends X> mapper) {
		return mapper.apply($(echo $(for j in `seq 1 ${i}`;do echo -n "arg${j}, ";done) | sed 's/,$//'));
	}
}
EOF
done

cat << EOF > $(dirname $0)/../src/main/java/am/ik/yavi/arguments/Arguments.java
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

import am.ik.yavi.jsr305.Nullable;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.3.0
 */
public final class Arguments {
$(for i in `seq 1 ${n}`;do
  cat <<EOJ
	public static <$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//')> Arguments${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//')> of($(echo $(for j in `seq 1 ${i}`;do echo -n "@Nullable A${j} arg${j}, ";done) | sed 's/,$//')) {
		return new Arguments${i}<>($(echo $(for j in `seq 1 ${i}`;do echo -n "arg${j}, ";done) | sed 's/,$//'));
	}

EOJ
done)
}
EOF

cat << EOF > $(dirname $0)/../src/main/java/am/ik/yavi/builder/ArgumentsValidatorBuilder.java
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.builder;

$(for i in `seq 1 ${n}`;do
echo "import am.ik.yavi.arguments.Arguments${i};"
echo "import am.ik.yavi.arguments.Arguments${i}Validator;"
done)
$(for i in `seq 1 ${n}`;do
echo "import am.ik.yavi.arguments.DefaultArguments${i}Validator;"
done)
$(for i in `seq 1 ${n}`;do
echo "import am.ik.yavi.fn.Function${i};"
done)

import java.util.Objects;
import java.util.function.Function;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.3.0
 */
public final class ArgumentsValidatorBuilder {
$(for i in `seq 1 ${n}`;do
  cat <<EOJ
	public static <$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> Arguments${i}ValidatorBuilder<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> of(Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends X> mapper) {
		return new Arguments${i}ValidatorBuilder<>(mapper);
	}
EOJ
done)

$(for i in `seq 1 ${n}`;do
  class="Arguments${i}ValidatorBuilder"
  arguments="${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X>"
  cat <<EOJ
	/**
	 * @since 0.3.0
	 */
	public static final class ${arguments} {
		private final Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends X> mapper;
		private ValidatorBuilder<Arguments${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//')>> builder;

		public ${class}(Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends X> mapper) {
			this.mapper = Objects.requireNonNull(mapper, "'mapper' must not be null.");
		}

		public ${arguments} builder(
				Function<? super ValidatorBuilder<Arguments${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//')>>, ? extends ValidatorBuilder<Arguments${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//')>>> definition) {
			this.builder = definition.apply(ValidatorBuilder.of());
			return this;
		}

		public Arguments${i}Validator<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> build() {
			return new DefaultArguments${i}Validator<>(this.builder.build(), this.mapper);
		}
	}

EOJ
done)
}
EOF

for i in `seq 1 ${n}`;do
  class="Arguments${i}Validator"
  file="$(dirname $0)/../src/main/java/am/ik/yavi/arguments/${class}.java"
  arguments="Arguments${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? extends A${j}, ";done) | sed 's/,$//')>"
  args="$(echo $(for j in `seq 1 ${i}`;do echo -n "@Nullable A${j} a${j}, ";done) | sed 's/,$//')"
  as="$(echo $(for j in `seq 1 ${i}`;do echo -n "a${j}, ";done) | sed 's/,$//')"
  echo $file
  cat <<EOF > ${file}
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

$(if [ "${i}" != "1" ];then
cat <<EOD
import java.util.Locale;
import java.util.function.Function;

import am.ik.yavi.core.ConstraintGroup;
import am.ik.yavi.core.ConstraintViolationsException;
import am.ik.yavi.core.Validated;
import am.ik.yavi.jsr305.Nullable;
EOD
fi)
$(if [ "${i}" == "1" ];then
cat <<EOD
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.function.Function;
import java.util.function.Supplier;

import am.ik.yavi.core.ConstraintGroup;
import am.ik.yavi.core.ConstraintViolationsException;
import am.ik.yavi.core.Validated;
import am.ik.yavi.core.ValidatorSubset;
import am.ik.yavi.core.ValueValidator;
import am.ik.yavi.jsr305.Nullable;
EOD
fi)

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.3.0
 */
@FunctionalInterface
$(if [ "${i}" == "1" ];then
cat <<EOD
public interface ${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> extends ValueValidator<A1, X> {

	/**
	 * Convert {@link ValidatorSubset} instance into {@link Arguments1Validator}
	 *
	 * @param validator core validator
	 * @param <X> target class
	 * @return arguments1 validator
	 * @since 0.8.0
	 */
	static <X> Arguments1Validator<X, X> from(ValidatorSubset<X> validator) {
		return Arguments1Validator.from(validator.applicative());
	}

	/**
	 * Convert {@link ValueValidator} instance into {@link Arguments1Validator}
	 *
	 * @param valueValidator value validator
	 * @param <A1> class of argument1
	 * @param <X> target class
	 * @return arguments1 validator
	 * @since 0.8.0
	 */
	static <A1, X> Arguments1Validator<A1, X> from(ValueValidator<A1, X> valueValidator) {
		return valueValidator::validate;
	}
EOD
else
cat <<EOD
public interface ${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> {
EOD
fi)

$(if [ "${i}" == "1" ];then
cat <<EOD
  @Override
	Validated<X> validate(${args},
			Locale locale, ConstraintGroup constraintGroup);
EOD
fi)
$(if [ "${i}" != "1" ];then
cat <<EOD
	Validated<X> validate(${args},
			Locale locale, ConstraintGroup constraintGroup);
EOD
fi)

	/**
	 * @since 0.7.0
	 */$(if [ "${i}" == "1" ];then echo;echo "	@Override"; fi)
	default <X2> ${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X2> andThen(Function<? super X, ? extends X2> mapper) {
		return (${as}, locale, constraintGroup) -> ${class}.this
				.validate(${as}, locale, constraintGroup).map(mapper);
	}

	/**
	 * @since 0.7.0
	 */
$(if [ "${i}" == "1" ];then
cat <<EOD
	@Override
	default <A> ${class}<A, X> compose(
			Function<? super A, ? extends A1> mapper) {
		return (a, locale, constraintGroup) -> ${class}.this
				.validate(mapper.apply(a), locale, constraintGroup);
	}
EOD
else
cat <<EOD
	default <A> Arguments1Validator<A, X> compose(
			Function<? super A, ? extends ${arguments}> mapper) {
		return (a, locale, constraintGroup) -> {
			final ${arguments} args = mapper.apply(a);
			return ${class}.this.validate($(echo $(for j in `seq 1 ${i}`;do echo -n "args.arg${j}(), ";done) | sed 's/,$//'), locale, constraintGroup);
		};
	}
EOD
fi)
$(cat <<EOD
	default Validated<X> validate(${args}) {
		return this.validate(${as}, Locale.getDefault(), ConstraintGroup.DEFAULT);
	}

	default Validated<X> validate(${args}, ConstraintGroup constraintGroup) {
		return this.validate(${as}, Locale.getDefault(), constraintGroup);
	}

	default Validated<X> validate(${args}, Locale locale) {
		return this.validate(${as}, locale, ConstraintGroup.DEFAULT);
	}

	default X validated(${args}) throws ConstraintViolationsException {
		return this.validate(${as}).orElseThrow(ConstraintViolationsException::new);
	}

	default X validated(${args}, ConstraintGroup constraintGroup)
			throws ConstraintViolationsException {
		return this.validate(${as}, constraintGroup)
				.orElseThrow(ConstraintViolationsException::new);
	}

	default X validated(${args}, Locale locale) throws ConstraintViolationsException {
		return this.validate(${as}, locale).orElseThrow(ConstraintViolationsException::new);
	}

	default X validated(${args}, Locale locale, ConstraintGroup constraintGroup)
			throws ConstraintViolationsException {
		return this.validate(${as}, locale, constraintGroup)
				.orElseThrow(ConstraintViolationsException::new);
	}
EOD)
$(if [ "${i}" == "1" ];then
cat <<EOD
	/**
	 * @since 0.7.0
	 */
	default <A$((${i} + 1)), Y> Arguments$((${i} + 1))Splitting<$(echo $(for j in `seq 1 $((${i} + 1))`;do echo -n "A${j}, ";done) | sed 's/,$//'), X, Y> split(ValueValidator<A$((${i} + 1)), Y> validator) {
		return new Arguments$((${i} + 1))Splitting<>(this, validator);
	}

	/**
	 * @since 0.7.0
	 */
	default <Y> Arguments$((${i} + 1))Combining<A${i}, X, Y> combine(ValueValidator<A${i}, Y> validator) {
		return new Arguments$((${i} + 1))Combining<>(this, validator);
	}

	/**
	 * @since 0.7.0
	 */
	@Override
	default Arguments1Validator<A1, X> indexed(int index) {
		return (a1, locale, constraintGroup) -> Arguments1Validator.this
				.validate(a1, locale, constraintGroup).indexed(index);
	}

	/**
	 * @since 0.8.0
	 */
	default <C extends Collection<X>> Arguments1Validator<Iterable<A1>, C> liftCollection(
			Supplier<C> factory) {
		return Arguments1Validator.from(ValueValidator.super.liftCollection(factory));
	}

	/**
	 * @since 0.8.0
	 */
	default Arguments1Validator<Iterable<A1>, List<X>> liftList() {
		return Arguments1Validator.from(ValueValidator.super.liftList());
	}

	/**
	 * @since 0.8.0
	 */
	default Arguments1Validator<Iterable<A1>, Set<X>> liftSet() {
		return Arguments1Validator.from(ValueValidator.super.liftSet());
	}

	/**
	 * @since 0.8.0
	 */
	default Arguments1Validator<Optional<A1>, Optional<X>> liftOptional() {
		return Arguments1Validator.from(ValueValidator.super.liftOptional());
	}
EOD
fi)

	/**
	 * Use {@link #validate($(echo $(for j in `seq 1 ${i}`;do echo -n "Object, ";done) | sed 's/,$//'))} instead
	 */
	@Deprecated
	default Validated<X> validateArgs(${args}) {
		return this.validate(${as});
	}

	/**
	 * Use {@link #validate($(echo $(for j in `seq 1 ${i}`;do echo -n "Object, ";done) | sed 's/,$//'), ConstraintGroup)} instead
	 */
	@Deprecated
	default Validated<X> validateArgs(${args}, ConstraintGroup constraintGroup) {
		return this.validate(${as}, constraintGroup);
	}

	/**
	 * Use {@link #validate($(echo $(for j in `seq 1 ${i}`;do echo -n "Object, ";done) | sed 's/,$//'), Locale)} instead
	 */
	@Deprecated
	default Validated<X> validateArgs(${args}, Locale locale) {
		return this.validate(${as}, locale);
	}

	/**
	 * Use {@link #validate($(echo $(for j in `seq 1 ${i}`;do echo -n "Object, ";done) | sed 's/,$//'), Locale, ConstraintGroup)} instead
	 */
	@Deprecated
	default Validated<X> validateArgs(${args}, Locale locale,
			ConstraintGroup constraintGroup) {
		return this.validate(${as}, locale, constraintGroup);
	}

	/**
	 * Consider using {@link #validate($(echo $(for j in `seq 1 ${i}`;do echo -n "Object, ";done) | sed 's/,$//'), ConstraintGroup)} instead
	 */
	@Deprecated
	default void validateAndThrowIfInvalid(${args}, ConstraintGroup constraintGroup) {
		throw new UnsupportedOperationException("validateAndThrowIfInvalid is not supported. Consider using validate method instead.");
	}

	/**
	 * Consider using {@link #validate($(echo $(for j in `seq 1 ${i}`;do echo -n "Object, ";done) | sed 's/,$//'))} instead
	 */
	@Deprecated
	default void validateAndThrowIfInvalid(${args}) {
		this.validateAndThrowIfInvalid(${as}, ConstraintGroup.DEFAULT);
	}
}
EOF
done

for i in `seq 1 ${n}`;do
  class="DefaultArguments${i}Validator"
  interface="Arguments${i}Validator"
  file="$(dirname $0)/../src/main/java/am/ik/yavi/arguments/${class}.java"
  arguments="Arguments${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//')>"
  args="$(echo $(for j in `seq 1 ${i}`;do echo -n "@Nullable A${j} a${j}, ";done) | sed 's/,$//')"
  as="$(echo $(for j in `seq 1 ${i}`;do echo -n "a${j}, ";done) | sed 's/,$//')"
  echo $file
  cat <<EOF > ${file}
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

import java.util.Locale;

import am.ik.yavi.core.ConstraintGroup;
import am.ik.yavi.core.ConstraintViolationsException;
import am.ik.yavi.core.Validated;
import am.ik.yavi.core.Validator;
import am.ik.yavi.fn.Function${i};
import am.ik.yavi.jsr305.Nullable;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.7.0
 */
public class ${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> implements ${interface}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> {
  protected final Validator<${arguments}> validator;
	protected final Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends X> mapper;

	public ${class}(Validator<${arguments}> validator, Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends X> mapper) {
		this.validator = validator;
		this.mapper = mapper;
	}

  @Override
	public Validated<X> validate(${args},
			Locale locale, ConstraintGroup constraintGroup) {
		return this.validator.applicative()
		    .validate(Arguments.of(${as}), locale, constraintGroup)
				.map(values -> values.map(this.mapper));
	}

	@Override
	public void validateAndThrowIfInvalid(${args}, ConstraintGroup constraintGroup) {
		this.validator.validate(Arguments.of(${as}), constraintGroup)
				.throwIfInvalid(ConstraintViolationsException::new);
	}
}
EOF
done

nn=10
for i in `seq 2 ${nn}`;do
  class="Arguments${i}Splitting"
  file="$(dirname $0)/../src/main/java/am/ik/yavi/arguments/${class}.java"
  echo $file
  cat <<EOF > ${file}
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

import am.ik.yavi.core.ValueValidator;
import am.ik.yavi.fn.Function${i};
import am.ik.yavi.fn.Validations;

/**
 * Generated by
 * https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.7.0
 */
public class ${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), $(echo $(for j in `seq 1 ${i}`;do echo -n "R${j}, ";done) | sed 's/,$//')> {
$(for j in `seq 1 ${i}`;do echo "	protected final ValueValidator<? super A${j}, ? extends R${j}> v${j};";echo;done)

	public ${class}($(echo $(for j in `seq 1 ${i}`;do echo -n "ValueValidator<? super A${j}, ? extends R${j}> v${j}, ";done) | sed 's/,$//')) {
$(for j in `seq 1 ${i}`;do echo "		this.v${j} = v${j};";done)
	}

	public <X> Arguments${i}Validator<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), X> apply(Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super R${j}, ";done) | sed 's/,$//'), ? extends X> f) {
		return ($(echo $(for j in `seq 1 ${i}`;do echo -n "a${j}, ";done) | sed 's/,$//'), locale, constraintGroup) -> Validations.apply(f::apply, $(echo $(for j in `seq 1 ${i}`;do echo -n "this.v${j}.validate(a${j}, locale, constraintGroup), ";done) | sed 's/,$//'));
	}
$(if [ ${i} -lt ${nn} ];then echo;echo "	public <A$((${i} + 1)), R$((${i} + 1))> Arguments$((${i} + 1))Splitting<$(echo $(for j in `seq 1 $((${i} + 1))`;do echo -n "A${j}, ";done) | sed 's/,$//'), $(echo $(for j in `seq 1 $((${i} + 1))`;do echo -n "R${j}, ";done) | sed 's/,$//')> split(ValueValidator<? super A$((${i} + 1)), ? extends R$((${i} + 1))> v$((${i} + 1))) {"; echo "		return new Arguments$((${i} + 1))Splitting<>($(echo $(for j in `seq 1 $((${i} + 1))`;do echo -n "v${j}, ";done) | sed 's/,$//'));"; echo "	}"; else echo -n "";fi)
}
EOF
done

for i in `seq 2 ${nn}`;do
  class="Arguments${i}Combining"
  file="$(dirname $0)/../src/main/java/am/ik/yavi/arguments/${class}.java"
  echo $file
  cat <<EOF > ${file}
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

import am.ik.yavi.core.ValueValidator;
import am.ik.yavi.fn.Function${i};
import am.ik.yavi.fn.Validations;

/**
 * Generated by
 * https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.7.0
 */
public class ${class}<A, $(echo $(for j in `seq 1 ${i}`;do echo -n "R${j}, ";done) | sed 's/,$//')> {
$(for j in `seq 1 ${i}`;do echo "	protected final ValueValidator<? super A, ? extends R${j}> v${j};";echo;done)

	public ${class}($(echo $(for j in `seq 1 ${i}`;do echo -n "ValueValidator<? super A, ? extends R${j}> v${j}, ";done) | sed 's/,$//')) {
$(for j in `seq 1 ${i}`;do echo "		this.v${j} = v${j};";done)
	}

	public <X> Arguments1Validator<A, X> apply(Function${i}<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super R${j}, ";done) | sed 's/,$//'), ? extends X> f) {
		return (a, locale, constraintGroup) -> Validations.apply(f::apply, $(echo $(for j in `seq 1 ${i}`;do echo -n "this.v${j}.validate(a, locale, constraintGroup), ";done) | sed 's/,$//'));
	}
$(if [ ${i} -lt ${nn} ];then echo;echo "	public <R$((${i} + 1))> Arguments$((${i} + 1))Combining<A, $(echo $(for j in `seq 1 $((${i} + 1))`;do echo -n "R${j}, ";done) | sed 's/,$//')> combine(ValueValidator<? super A, ? extends R$((${i} + 1))> v$((${i} + 1))) {"; echo "		return new Arguments$((${i} + 1))Combining<>($(echo $(for j in `seq 1 $((${i} + 1))`;do echo -n "v${j}, ";done) | sed 's/,$//'));"; echo "	}"; else echo -n "";fi)
}
EOF
done

class="ArgumentsValidators"
file="$(dirname $0)/../src/main/java/am/ik/yavi/arguments/${class}.java"
echo $file
cat <<EOF > ${file}
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.Function;
import java.util.function.Supplier;

import am.ik.yavi.core.Validated;
import am.ik.yavi.core.ValueValidator;

import static java.util.function.Function.identity;

/**
 * Generated by
 * https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.7.0
 */
public class ${class} {

$(for i in `seq 2 ${nn}`;do cat <<EOD
	public static <$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), $(echo $(for j in `seq 1 ${i}`;do echo -n "R${j}, ";done) | sed 's/,$//')> Arguments${i}Splitting<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), $(echo $(for j in `seq 1 ${i}`;do echo -n "R${j}, ";done) | sed 's/,$//')> split($(echo $(for j in `seq 1 ${i}`;do echo -n "ValueValidator<? super A${j}, ? extends R${j}> v${j}, ";done) | sed 's/,$//')) {
		return new Arguments${i}Splitting<>($(echo $(for j in `seq 1 ${i}`;do echo -n "v${j}, ";done) | sed 's/,$//'));
	}
EOD
done)

$(for i in `seq 2 ${nn}`;do cat <<EOD
	public static <A, $(echo $(for j in `seq 1 ${i}`;do echo -n "R${j}, ";done) | sed 's/,$//')> Arguments${i}Combining<A, $(echo $(for j in `seq 1 ${i}`;do echo -n "R${j}, ";done) | sed 's/,$//')> combine($(echo $(for j in `seq 1 ${i}`;do echo -n "ValueValidator<? super A, ? extends R${j}> v${j}, ";done) | sed 's/,$//')) {
		return new Arguments${i}Combining<>($(echo $(for j in `seq 1 ${i}`;do echo -n "v${j}, ";done) | sed 's/,$//'));
	}
EOD
done)

$(for i in `seq 1 ${nn}`;do cat <<EOD
	public static <$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), R, T> Arguments${i}Validator<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), List<R>> traverse${i}(
			Iterable<T> values,
			Function<? super T, ? extends Arguments${i}Validator<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends R>> f) {
		return ($(echo $(for j in `seq 1 ${i}`;do echo -n "a${j}, ";done) | sed 's/,$//'), locale, constraintGroup) ->
			Validated.traverse(values, f.andThen(validator -> validator.validate($(echo $(for j in `seq 1 ${i}`;do echo -n "a${j}, ";done) | sed 's/,$//'), locale, constraintGroup)));
	}
EOD
done)

$(for i in `seq 1 ${nn}`;do cat <<EOD
	public static <$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), R> Arguments${i}Validator<$(echo $(for j in `seq 1 ${i}`;do echo -n "A${j}, ";done) | sed 's/,$//'), List<R>> sequence${i}(
		Iterable<? extends Arguments${i}Validator<$(echo $(for j in `seq 1 ${i}`;do echo -n "? super A${j}, ";done) | sed 's/,$//'), ? extends R>> values) {
		return traverse${i}(values, identity());
	}
EOD
done)

	/**
	 * @since 0.8.0
	 */
	public static <A1, R, C extends Collection<R>> Arguments1Validator<Iterable<A1>, C> liftCollection(
			ValueValidator<? super A1, ? extends R> validator, Supplier<C> factory) {
		return Arguments1Validator
				.from(ValueValidator.liftCollection(validator, factory));
	}

	public static <A1, R> Arguments1Validator<Iterable<A1>, List<R>> liftList(
			ValueValidator<? super A1, ? extends R> validator) {
		return Arguments1Validator.from(ValueValidator.liftList(validator));
	}

	/**
	 * @since 0.8.0
	 */
	public static <A1, R> Arguments1Validator<Iterable<A1>, Set<R>> liftSet(
			ValueValidator<? super A1, ? extends R> validator) {
		return Arguments1Validator.from(ValueValidator.liftSet(validator));
	}

	/**
	 * @since 0.8.0
	 */
	public static <A1, R> Arguments1Validator<Optional<A1>, Optional<R>> liftOptional(
			ValueValidator<? super A1, ? extends R> validator) {
		return Arguments1Validator.from(ValueValidator.liftOptional(validator));
	}

}
EOF