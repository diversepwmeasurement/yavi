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

import am.ik.yavi.fn.Function4;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.3.0
 */
public class Arguments4<A1, A2, A3, A4> extends Arguments3<A1, A2, A3> {

	protected final A4 arg4;

	Arguments4(A1 arg1, A2 arg2, A3 arg3, A4 arg4) {
		super(arg1, arg2, arg3);
		this.arg4 = arg4;
	}

	public final A4 arg4() {
		return this.arg4;
	}

	public final <X> X map(
			Function4<? super A1, ? super A2, ? super A3, ? super A4, ? extends X> mapper) {
		return mapper.apply(arg1, arg2, arg3, arg4);
	}
}
